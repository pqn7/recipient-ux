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
    #file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cdc_cfi_complete_20240827.csv"
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

def recipient_writer(file_name, fileout, file_bytes):
    """ write the CSV in RFC 4180 """
    with open(fileout, 'w') as csv_out:
        dialect, reader = sniff_csv(file_name, file_bytes)
        reader_in = csv.writer(csv_out, dialect=dialect, delimiter=',', doublequote=True,
                                quotechar='"', quoting=csv.QUOTE_MINIMAL, lineterminator='\r\n')
        reader_in.writerows(reader)



#if __name__ == "__main__":
#    
#    file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/CDC Raw Data File _Combined_8.27_FINAL-no$-raw-data.csv"
#    file_out = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/alan/cfi-raw-data.csv"
    #dialect, reader = sniff_csv(file_name, init_read(file_name))
#    recipient_writer(file_name, file_out, read_bytes(file_name))