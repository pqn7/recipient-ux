# resources: google search: pandas read_csv not reading "seconds" using AI Overview to parse date with time
#            chatCDC: add parsing multiple date formats
import pandas as pd
def parse_dates(x):
    """ function to convert datetime into pandas datetime"""
    for fmt in ("%Y-%m-%d %H:%M:%S", "%A, %B %d, %Y"):
        try:
            return pd.to_datetime(x, format=fmt)
        except ValueError:
            continue
    # If no format matched, return NaT (Not a Time) or raise an error
    return pd.NaT  # Or raise ValueError('no valid date format found')