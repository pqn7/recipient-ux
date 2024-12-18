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
import json

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


def get_character_details(char):
    """ Get detailed information about the character based on its Unicode code point """
    char_code = ord(char)
    
    # Mapping of specific non-standard and extended ASCII characters to their detailed descriptions
    description_map = {
        # Non-standard ASCII (Control Characters)
        0: ("NULL", "Null character"),
        1: ("SOH", "Start of header"),
        2: ("STX", "Start of text"),
        3: ("ETX", "End of text"),
        4: ("EOT", "End of transmission"),
        5: ("ENQ", "Enquiry"),
        6: ("ACK", "Acknowledge"),
        7: ("BEL", "Bell"),
        8: ("BS", "Backspace"),
        9: ("HT", "Horizontal tab"),
        10: ("LF", "Line feed"),
        11: ("VT", "Vertical tab"),
        12: ("FF", "Form feed"),
        13: ("CR", "Carriage return"),
        14: ("SO", "Shift out"),
        15: ("SI", "Shift in"),
        16: ("DLE", "Data link escape"),
        17: ("DC1", "Device control one"), 
		18: ("DC2","Device control two"), 
		19: ("DC3","Device control three"), 
		20: ("DC4","Device control four"), 
		21 :("NAK","Negative acknowledge"), 
	    22 :("SYN","Synchronous idle"), 
	    23 :("ETB","End of trans. Block"), 
	    24 :("CAN","Cancel"), 
	    25 :("EM","End of medium"), 
	    26 :("SUB","Substitute"), 
	    27 :("ESC","Escape"), 
	    28 :("FS","File separator"), 
	    29 :("GS","Group separator"), 
	    30 :("RS","Record separator"),  
	    # Extended ASCII Characters
    	128 : ('€', 'Euro sign'),
    	129 : ('', 'Unused'),
        130 : ('‚', 'Single low-9 quotation mark'),
    	131 : ('ƒ', 'Latin small letter f with hook'),
    	132 : ('„', 'Double low-9 quotation mark'),
    	133 : ('…', 'Horizontal ellipsis'),
    	134 : ('†', 'Dagger'),
    	135 : ('‡', 'Double dagger'),
    	136 : ('ˆ', 'Modifier letter circumflex accent'),
    	137 : ('‰', 'Per mille sign'),
    	138 : ('Š', 'Latin capital letter S with caron'),
    	139 : ('‹', 'Single left-pointing angle quotation mark'),
    	140 : ('Œ', 'Latin capital ligature OE'),
    	141 : ('', 'Unused'),  
    	142 : ('Ž', 'Latin capital letter Z with caron'),  
    	143 : ('', 'Unused'),  
    	144 : ('', 'Unused'),  
    	145 : ("‘", "Left single quotation mark"),  
	    146: ("’", "Right single quotation mark"),  
	    147: ("“", "Left double quotation mark"),  
	    148: ("”", "Right double quotation mark"),  
	    149: ("•", "Bullet"),  
	    150: ("–", "En dash"),  
	    151: ("—", "Em dash"),  
	    152: ("˜", "Small tilde"),  
	    153: ("™", "Trade mark sign"),  
	    154: ("š", "Latin small letter S with caron"),  
	    155: ("›", "Single right-pointing angle quotation mark"),  
	    156: ("œ", "Latin small ligature oe"),
	    157: ("", "Unused"),
	    158: ("ž", "Latin small letter z with caron"),
	    159: ("Ÿ", "Latin capital letter Y with diaeresis"),
	    
        # Additional Extended ASCII Characters
        160: ("\u00A0" , 'Non-breaking space'), 
        161: ('¡', 'Inverted exclamation mark'), 
        162: ('¢', 'Cent sign'), 
        163: ('£', 'Pound sign'), 
        164: ('¤', 'Currency sign'), 
        165: ('¥', 'Yen sign'), 
        166: ('¦', 'Pipe, broken vertical bar'), 
        167: ('§', 'Section sign'), 
        168: ('¨', 'Spacing diaeresis – umlaut'), 
        169: ('©', 'Copyright sign'), 
        170: ('ª', 'Feminine ordinal indicator'), 
        171: ('«', 'Left double-angle quotes'), 
        172: ('¬', 'Negation'),
        173: ('­SHY', 'Soft hyphen'),
        174: ('®', 'Registered trademark sign'),
        175: ('¯', 'Spacing macron – overline'),
        176: ('°', 'Degree sign'),
        177: ('±', 'Plus-or-minus sign'),
        178: ('²', 'Superscript two-squared'),
        179: ('³', 'Superscript three – cubed'),
        180: ('´', 'Acute accent – spacing acute'),
        181: ('µ', 'Micro sign'),
        182: ('¶', 'Pilcrow sign – paragraph sign'),
        183: ('.','Middle dot – Georgian comma'),
	    184 :('¸','Spacing cedilla'),  
	    185 :('¹','Superscript one'),  
	    186 :('º','Masculine ordinal indicator'),  
	    187 :('»','Right double-angle quotes'),  
	    188 :('¼','Fraction one quarter'),  
	    189 :('½','Fraction one half'),  
	    190 :('¾','Fraction three quarters'),  
	    191 :('¿','Inverted question mark'),

    	192 :('À','Latin capital letter A with grave'),
    	193 :('Á','Latin capital letter A with acute'),
    	194 :('Â','Latin capital letter A with circumflex'),
    	195 :('Ã','Latin capital letter A with tilde'),
    	196 :('Ä','Latin capital letter A with diaeresis'),
        197: ('Å', 'Latin capital letter A with ring above'),
        198: ('Æ', 'Latin capital letter AE'),
        199: ('Ç', 'Latin capital letter C with cedilla'),
        200: ('È', 'Latin capital letter E with grave'),
        201: ('É', 'Latin capital letter E with acute'),
        202: ('Ê', 'Latin capital letter E with circumflex'),
        203: ('Ë', 'Latin capital letter E with diaeresis'),
        204: ('Ì', 'Latin capital letter I with grave'),
        205: ('Í', 'Latin capital letter I with acute'),
        206: ('Î', 'Latin capital letter I with circumflex'),
        207: ('Ï', 'Latin capital letter I with diaeresis'),

        208: ('Ð', 'Latin capital letter ETH'),
        209: ('Ñ', 'Latin capital letter N with tilde'),
        210: ('Ò', 'Latin capital letter O with grave'),
        211: ('Ó', 'Latin capital letter O with acute'),
        212: ('Ô', 'Latin capital letter O with circumflex'),
        213: ('Õ', 'Latin capital letter O with tilde'),
        214: ('Ö', 'Latin capital letter O with diaeresis'),
        215: ('×', 'Multiplication sign'),

		216 :('Ø','Latin Capital Letter O With Slash'), 
		217 :('Ù','Latin Capital Letter U With Grave'), 
		218 :('Ú','Latin Capital Letter U With Acute'), 
		219 :('Û','Latin Capital Letter U With Circumflex'), 
		220 :('Ü','Latin Capital Letter U With Diaeresis'), 
	    221 :('Ý','Latin Capital Letter Y With Acute'),  
	    222 :('Þ','LATIN CAPITAL LETTER THORN'),  
	    223 :('ß','LATIN SMALL LETTER SHARP S – ESS-ZED'),

    	224 :('à','LATIN SMALL LETTER A WITH GRAVE'),	
    	225 :('á','LATIN SMALL LETTER A WITH ACUTE'),	
        226: ('â', 'Latin small letter a with circumflex'),
        227: ('ã', 'Latin small letter a with tilde'),
        228: ('ä', 'Latin small letter a with diaeresis'),
        229: ('å', 'Latin small letter a with ring above'),
        230: ('æ', 'Latin small letter ae'),
        231: ('ç', 'Latin small letter c with cedilla'),
        232: ('è', 'Latin small letter e with grave'),
        233: ('é', 'Latin small letter e with acute'),

        234: ('ê', 'Latin small letter e with circumflex'),
        235: ('ë', 'Latin small letter e with diaeresis'),
        236: ('ì', 'Latin small letter i with grave'),
        237: ('í', 'Latin small letter i with acute'),
        238: ('î', 'Latin small letter i with circumflex'),
        239: ('ï', 'Latin small letter i with diaeresis'),

		240 :('ð','LATIN SMALL LETTER ETH'), 
		241 :('ñ','LATIN SMALL LETTER N WITH TILDE'), 
		242 :('ò','LATIN SMALL LETTER O WITH GRAVE'), 
		243 :('ó','LATIN SMALL LETTER O WITH ACUTE'), 
		244 :('ô','LATIN SMALL LETTER O WITH CIRCUMFLEX'), 
	    245 :('õ','LATIN SMALL LETTER O WITH TILDE'),  
	    246 :('ö','LATIN SMALL LETTER O WITH DIAERESIS'),  
	    247 :('÷','DIVISION SIGN'),  

    	248: ('ø', 'Latin small letter o with slash'),
    	249: ('ù', 'Latin small letter u with grave'),
    	250: ('ú', 'Latin small letter u with acute'),
    	251: ('û', 'Latin small letter u with circumflex'),

    	252: ('ü', 'Latin small letter u with diaeresis'),
    	253: ('ý', 'Latin small letter y with acute'),
    	254: ('þ', 'Latin small letter thorn'),
        255: ('ÿ', 'Latin small letter y with diaeresis'),
    }

    # Get details from the mapping
    symbol, description = description_map.get(char_code, (char, "Printable character"))
    
    return {
        "dec": char_code,
        "oct": oct(char_code),
        "hex": hex(char_code),
        "bin": format(char_code, '08b'),
        "symbol": symbol,
        "html_number": f'&#{char_code};',
        "description": description
    }

def count_non_ascii_characters(input_file_name, output_json_file_name):
    """ Count non-standard and extended ASCII characters and generate hierarchical JSON output """
    
    non_standard_ascii_details = []
    extended_ascii_details = []

    with open(input_file_name, 'r', encoding='utf-8') as csvfile:
        reader = csv.reader(csvfile)

        for row in reader:
            for cell in row:
                for char in cell:
                    details = get_character_details(char)
                    if details["dec"] < 32 or details["dec"] == 127:  # Non-standard ASCII range
                        non_standard_ascii_details.append(details)
                    elif details["dec"] >= 128:  # Extended ASCII range
                        extended_ascii_details.append(details)

    # Create a hierarchical structure for JSON output
    json_output = {
        "input_file": input_file_name,
        "output_file": output_json_file_name,
        "non_standard_ascii_characters": {
            "total_count": len(non_standard_ascii_details),
            "characters": non_standard_ascii_details
        },
        "extended_ascii_characters": {
            "total_count": len(extended_ascii_details),
            "characters": extended_ascii_details
        }
    }

    # Write to a JSON file
    with open(output_json_file_name, 'w', encoding='utf-8') as jsonfile:
        json.dump(json_output, jsonfile, ensure_ascii=False, indent=4)


if __name__ == "__main__":
    
    file_name = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/data/new-revisions/completers_cdc.csv"
    file_out = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/data/new-revisions/rfc4180/completers_cdc.csv"
    json_out = "C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/data/new-revisions/rfc4180/completers_cdc-non-ascii.json"
    recipient_writer(file_name, file_out, read_bytes(file_name))

    count_non_ascii_characters(file_name, json_out)
