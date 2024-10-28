# resource chatCDC
def get_unique_vals(survey):
    # Get distinct values across all columns
    unique_values_per_column = {col: survey[col].unique() for col in survey.columns}

    # Print only up to 10 unique values per column
    for col, values in unique_values_per_column.items():
        limited_values = ', '.join(str(value) for value in values[:10])
        overflow = '...' if len(values) > 10 else ''
        print(f"Column: {col}")
        print(f"Unique Values ({len(values)}): {limited_values}{overflow}\n")


# resources: google search: pandas read_csv not reading "seconds" using AI Overview to 
#               parse date with time
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
    return pd.NaT