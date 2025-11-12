from django.db import models

class Stock(models.Model):
    """
    Model to store the stock name and its corresponding margin.
    This data will be populated by the CSV upload.
    The 'ticker' is the unique symbol (e.g., RELIANCE.NS).
    The 'name' is the full company name (e.g., Reliance Industries Limited).
    """
    ticker = models.CharField(max_length=20, unique=True, db_index=True)
    name = models.CharField(max_length=255)
    margin = models.CharField(max_length=50) # e.g., "6.25X"
    icon = models.CharField(max_length=100, blank=True, null=True) 

    def __str__(self):
        return f"{self.name} ({self.ticker}) - {self.margin}"