
def get_unique_vals(survey):
    # Get distinct values across all columns
    unique_values_per_column = {col: survey[col].unique() for col in survey.columns}

    # Print only up to 10 unique values per column
    for col, values in unique_values_per_column.items():
        limited_values = ', '.join(str(value) for value in values[:10])
        overflow = '...' if len(values) > 10 else ''
        print(f"Column: {col}")
        print(f"Unique Values ({len(values)}): {limited_values}{overflow}\n")