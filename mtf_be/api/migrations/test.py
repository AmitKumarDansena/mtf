from django.test import TestCase, override_settings
from django.urls import reverse
from django.core.files.uploadedfile import SimpleUploadedFile
from rest_framework import status
from unittest.mock import patch, MagicMock

from .models import Stock

# Override the CSV_UPLOAD_SECRET for testing
@override_settings(CSV_UPLOAD_SECRET='testsecret')
class ApiTests(TestCase):

    def setUp(self):
        # This will be our authorization header
        self.auth_header = 'Token testsecret'

    def test_hello_world_endpoint(self):
        """Test the hello_world API endpoint."""
        url = reverse('hello_world')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json(), {"message": "Hello, world! This is your Django backend on Vercel!"})

    def test_api_root_endpoint(self):
        """Test the api_root endpoint returns HTML."""
        url = reverse('api_root')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertIn(b"<h1>Findoc Backend API</h1>", response.content)
        self.assertIn(b"Go to IPO", response.content)

    def test_get_mtf_stocks_empty(self):
        """Test get_mtf_stocks endpoint when no stocks are in the DB."""
        url = reverse('get_mtf_stocks')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.json(), [])

    def test_get_mtf_stocks_with_data(self):
        """Test get_mtf_stocks endpoint after populating data."""
        Stock.objects.create(ticker="RELIANCE.NS", name="Reliance Industries", margin="5X", icon="business")
        Stock.objects.create(ticker="TCS.NS", name="Tata Consultancy Services", margin="4X", icon="web")
        
        url = reverse('get_mtf_stocks')
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        data = response.json()
        self.assertEqual(len(data), 2)
        # Stocks are ordered by name
        self.assertEqual(data[0]['name'], "Reliance Industries")
        self.assertEqual(data[1]['ticker'], "TCS.NS")

    @patch('api.views.yf.Tickers') # Mock the yfinance.Tickers call
    def test_upload_csv_success(self, mock_yf_tickers):
        """Test the CSV upload endpoint with a valid file and token."""
        
        # 1. Setup the mock for yfinance
        mock_reliance = MagicMock()
        mock_reliance.info = {'longName': 'Reliance Industries Ltd.', 'shortName': 'Reliance'}
        mock_tcs = MagicMock()
        mock_tcs.info = {'longName': 'Tata Consultancy Services Ltd.', 'shortName': 'TCS'}

        # Configure the mock to return the correct info for each ticker
        mock_yf_tickers.return_value.tickers = {
            'RELIANCE.NS': mock_reliance,
            'TCS.NS': mock_tcs,
        }

        # 2. Create a mock CSV file content
        csv_content = "ticker,margin\nRELIANCE.NS,5X\nTCS.NS,4X\n"
        mock_csv_file = SimpleUploadedFile(
            "test_stocks.csv",
            csv_content.encode('utf-8'),
            content_type="text/csv"
        )

        # 3. Make the POST request
        url = reverse('upload_csv')
        response = self.client.post(
            url,
            {'file': mock_csv_file},
            HTTP_AUTHORIZATION=self.auth_header # Add the auth header
        )

        # 4. Check assertions
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.json(), {"message": "Successfully uploaded and created 2 stocks."})

        # Check if data is in the database
        self.assertEqual(Stock.objects.count(), 2)
        reliance_stock = Stock.objects.get(ticker="RELIANCE.NS")
        self.assertEqual(reliance_stock.name, "Reliance Industries Ltd.")
        self.assertEqual(reliance_stock.margin, "5X")

    def test_upload_csv_unauthorized(self):
        """Test the CSV upload endpoint with no token."""
        url = reverse('upload_csv')
        response = self.client.post(url, {}) # No file, no auth
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.json(), {"error": "Unauthorized"})

    def test_upload_csv_wrong_token(self):
        """Test the CSV upload endpoint with an invalid token."""
        url = reverse('upload_csv')
        response = self.client.post(
            url, 
            {},
            HTTP_AUTHORIZATION="Token wrongsecret"
        )
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.json(), {"error": "Unauthorized"})

    def test_upload_csv_no_file(self):
        """Test the CSV upload endpoint with no file provided."""
        url = reverse('upload_csv')
        response = self.client.post(
            url,
            {}, # Empty data
            HTTP_AUTHORIZATION=self.auth_header
        )
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.json(), {"error": "No file provided"})