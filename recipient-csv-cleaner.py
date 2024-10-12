# script to read recipient CSV data file with embedded commas
# author: alan hamm
# date: october 2024

# resources:
#   https://www.geeksforgeeks.org/get-file-size-in-bytes-kb-mb-and-gb-using-python/

#%%
import csv
import os

def init_read(file_name):
    # get filesize in bytes
    #file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cdc_cfi_complete_20240827.csv"
    file_name_size_bytes = os.path.getsize(file_name)
    file_name_size_third = file_name_size_bytes // 3 # read one third of file bytes
    return file_name_size_third

def sniff_csv(file_name, fileout, file_bytes):

    csvfile = open(file_name, "r")
    dialect = csv.Sniffer().sniff(csvfile.read(file_bytes))
    csvfile.seek(0)
    reader = csv.reader(csvfile, dialect)
    return dialect, reader

def recipient_writer(file_name, fileout, file_bytes):
    with open(fileout, 'w') as csv_out:
        dialect, reader = sniff_csv(file_name, fileout, file_bytes)
        reader_in = csv.writer(csv_out, dialect=dialect, delimiter=',',
                                quotechar='"', quoting=csv.QUOTE_MINIMAL, lineterminator='\r\n')
                                
        reader_in.writerows(reader)

if __name__ == "__main__":
    
    file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cdc_cfi_complete_20240827.csv"
    file_out = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cdc_cfi_complete.csv"
    #dialect, reader = sniff_csv(file_name, init_read(file_name))
    recipient_writer(file_name, file_out, init_read(file_name))