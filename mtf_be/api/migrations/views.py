from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse, JsonResponse
from django.conf import settings
from .models import Stock
import csv
import io
import yfinance as yf # Import yfinance
import decimal # Import decimal for precise calculations

@api_view(['GET'])
def api_root(request):
    """
    Serves a default HTML page with redirect buttons
    when accessing the API root.
    """
    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Findoc API</title>
        <style>
            body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; 
                   display: grid; place-items: center; min-height: 80vh; background-color: #f4f7f6; }
            .container { text-align: center; background: #fff; padding: 2rem 3rem; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
            h1 { color: #333; }
            .buttons { display: flex; flex-direction: column; gap: 1rem; margin-top: 1.5rem; }
            .button { 
                display: block;
                padding: 0.75rem 1.5rem; 
                font-size: 1rem;
                font-weight: 500;
                text-decoration: none; 
                border-radius: 8px; 
                transition: all 0.2s ease;
                min-width: 200px;
            }
            .button-ipo { background-color: #FF830F; color: white; border: 1px solid #F06706; }
            .button-ipo:hover { background-color: #e6760e; }
            .button-refer { background-color: #transparent; color: #FF830F; border: 1px solid #FF830F; }
            .button-refer:hover { background-color: #fff8ed; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Findoc Backend API</h1>
            <p>This is the API service for the Findoc MTF application.</p>
            <div class="buttons">
                <a href="https://uat-ipo.findoc.com/" target="_blank" class="button button-ipo">Go to IPO</a>
                <a href="https://www.ref-r.com/clients/findoc?UserId=FDE1136&SessionId=0x015F31EBED1358980401200947D116&Link=2&Calling_App=FT&Target_App=CLIENTSUMMARY&Product=ODIN%20AERO" target="_blank" class="button button-refer">Refer and Earn</a>
            </div>
        </div>
    </body>
    </html>
    """
    return HttpResponse(html_content)


@api_view(['GET'])
def get_mtf_stocks(request):
    """
    Serves the list of MTF-eligible stocks from the database.
    """
    try:
        stocks = Stock.objects.all().order_by('name')
        # Serialize the data to match the format your frontend expects
        data = [
            {
                "ticker": stock.ticker,
                "name": stock.name, 
                "margin": stock.margin, 
                "icon": stock.icon
            }
            for stock in stocks
        ]
        return Response(data)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['POST'])
def upload_csv(request):
    """
    Uploads a CSV file to populate the Stock model.
    This endpoint is secured by a secret key.
    
    CSV format:
    ticker,margin
    RELIANCE.NS,6.25X
    TCS.NS,5X
    ...
    """
    # 1. Check for the secret key in the headers
    auth_header = request.headers.get('Authorization')
    expected_token = f"Token {settings.CSV_UPLOAD_SECRET}"

    if not auth_header or auth_header != expected_token:
        return JsonResponse({"error": "Unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)

    # 2. Check if the file exists
    if 'file' not in request.FILES:
        return JsonResponse({"error": "No file provided"}, status=status.HTTP_400_BAD_REQUEST)

    # 3. Process the file
    csv_file = request.FILES['file']
    if not csv_file.name.endswith('.csv'):
        return JsonResponse({"error": "File is not a CSV"}, status=status.HTTP_400_BAD_REQUEST)

    # We use this to map icon names from your old list
    # In a real app, you might add an 'icon' column to your CSV
    icon_map = {
        "Vodafone Idea": "network_cell",
        "Infibeam Avenues": "web",
        "RBL Bank": "account_balance",
        "Canara Bank": "account_balance_wallet",
        "Yes Bank": "check_circle_outline",
        "Adani Powers": "power",
        "PC Jeweller": "diamond_outlined",
        "ICICI Bank": "account_balance",
    }

    try:
        # Decode the file as text
        data = io.StringIO(csv_file.read().decode('utf-8'))
        reader = csv.reader(data)
        
        # Skip header row
        next(reader, None)

        # 4. Clear the old stock data
        Stock.objects.all().delete()
        
        # 5. Add new stocks
        stocks_to_create = []
        tickers_to_fetch = []
        margin_map = {}
        
        # Use Decimal for precision
        DECIMAL_100 = decimal.Decimal('100')

        for row in reader:
            if not row or len(row) < 2: continue # Skip empty/invalid rows
            
            ticker = row[0].strip().upper()
            margin_percent_str = row[1].strip()
            
            if ticker and margin_percent_str:
                try:
                    # Calculate leverage from the margin percentage
                    # e.g., 26.52 -> (100 / 26.52) = 3.77X
                    margin_percent = decimal.Decimal(margin_percent_str)
                    if margin_percent == 0:
                        continue # Skip if margin is 0 to avoid division error
                        
                    leverage = (DECIMAL_100 / margin_percent).quantize(
                        decimal.Decimal('0.01'), rounding=decimal.ROUND_DOWN
                    )
                    margin_leverage_str = f"{leverage}X"
                    
                    # Add .NS suffix for Yahoo Finance
                    ticker_with_suffix = f"{ticker}.NS" 
                    
                    tickers_to_fetch.append(ticker_with_suffix)
                    # Map the suffix-added ticker to its calculated leverage string
                    margin_map[ticker_with_suffix] = margin_leverage_str
                
                except decimal.InvalidOperation:
                    # Skip row if margin is not a valid number
                    print(f"Skipping row with invalid margin: {row}")
                    continue
        
        if not tickers_to_fetch:
            return JsonResponse({"error": "CSV contained no valid tickers."}, status=status.HTTP_400_BAD_REQUEST)

        # Fetch data from Yahoo Finance in bulk
        yf_tickers = yf.Tickers(tickers_to_fetch)
        
        for ticker_symbol in tickers_to_fetch:
            try:
                # yf.Tickers downloads data for all tickers, access info via .tickers dict
                stock_info = yf_tickers.tickers.get(ticker_symbol)
                
                if stock_info:
                    # .info might be empty if ticker is invalid
                    info = stock_info.info
                    # Get the full name, fallback to short name, fallback to ticker
                    stock_name = info.get('longName', info.get('shortName', ticker_symbol))
                else:
                    stock_name = ticker_symbol # Fallback if ticker not found

                stocks_to_create.append(
                    Stock(
                        ticker=ticker_symbol,
                        name=stock_name,
                        margin=margin_map[ticker_symbol], # Use the calculated "3.77X" format
                        icon=icon_map.get(stock_name, "business") # Default icon
                    )
                )
            except Exception as e:
                # Log error for a specific ticker and continue
                print(f"Error processing ticker {ticker_symbol}: {e}")
                # Add with fallback name
                stocks_to_create.append(
                    Stock(
                        ticker=ticker_symbol,
                        name=ticker_symbol,
                        margin=margin_map[ticker_symbol], # Use the calculated "3.77X" format
                        icon="business"
                    )
                )

        Stock.objects.bulk_create(stocks_to_create)
        
        return JsonResponse(
            {"message": f"Successfully uploaded and created {len(stocks_to_create)} stocks."},
            status=status.HTTP_201_CREATED
        )

    except Exception as e:
        return JsonResponse({"error": f"An error occurred: {str(e)}"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@api_view(['GET'])
def hello_world(request):
    """
    A simple API endpoint that returns a "Hello World" message.
    """
    return Response({"message": "Hello, world! This is your Django backend on Vercel!"})