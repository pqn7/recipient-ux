# script to read recipient CSV data file with embedded commas
# author: alan hamm
# date: october 2024

# resources:
#   https://www.geeksforgeeks.org/get-file-size-in-bytes-kb-mb-and-gb-using-python/
#   https://docs.python.org/3/library/csv.html
#   https://www.ietf.org/rfc/rfc4180.txt

#%%
import csv
import os

def read_bytes(file_name):
    """ get filesize in bytes """
    return os.path.getsize(file_name)


def sniff_csv(file_name, file_bytes):
    """ get the dialect object: attributes describing the format of the CSV file
        get the reader object: process lines from the given csvfile
    """
    csvfile = open(file_name, "r")
    dialect = csv.Sniffer().sniff(csvfile.read(file_bytes))
    csvfile.seek(0)
    reader = csv.reader(csvfile, dialect)
    return dialect, reader

def convert_smart_quotes(text):
    """ Convert smart quotes to straight quotes """
    if isinstance(text, str):
        text = text.replace('“', '"').replace('”', '"')  # Replace left and right double smart quotes
        text = text.replace('‘', "'").replace('’', "'")  # Replace left and right single smart quotes
    return text

def recipient_writer(file_name, fileout, file_bytes):
    """ write the CSV in RFC 4180 """
    with open(fileout, 'w', newline='', encoding='utf-8') as csv_out:
        dialect, reader = sniff_csv(file_name, file_bytes)

        reader_in = csv.writer(csv_out, dialect=dialect, delimiter=',', doublequote=True,
                                quotechar='"', quoting=csv.QUOTE_MINIMAL, lineterminator='\r\n')

        # Process each row and convert smart quotes to straight quotes
        for row in reader:
            converted_row = [convert_smart_quotes(cell) for cell in row]
            reader_in.writerow(converted_row)



if __name__ == "__main__":
    
    file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/data/completers_cdc.csv"
    file_out = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/data/rfc4180/completers_cdc_rfc4180.csv"
    recipient_writer(file_name, file_out, read_bytes(file_name))