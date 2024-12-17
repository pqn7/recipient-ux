#%%
import spacy
from spacy import displacy
import mammoth

# Load spaCy model
nlp = spacy.load("en_core_web_trf")
import en_core_web_trf
nlp = en_core_web_trf.load()
nlp.max_length = 10_000_000  # Increase max_length for large documents

def extract_text_with_mammoth(file_path):
    """
    Extract text from a Word document using Mammoth.
    """
    with open(file_path, "rb") as docx_file:
        result = mammoth.extract_raw_text(docx_file)
    return result.value

def annotate_and_generate_html(text, output_file):
    """
    Process text with spaCy, highlight entities, and save as HTML.
    """
    #print(f"Extracted text from the input file:\n{text[:500]}")  # Print the first 500 characters

    doc = nlp(text)
    print(f"Processed document with {len(doc)} tokens.")

    # Filter for specific entities if needed (PERSON, GPE, ORG)
    options = {"ents": ["PERSON", "PLACE"], "colors": {"PERSON": "lightblue", "PLACE": "lightgreen"}}
    
    # Render HTML with displaCy
    #
    #print(f"Generated HTML length: {len(html)}")

    # Save HTML to file
    #with open(output_file, "w", encoding="utf-8") as file:
    #    file.write(html)
    # Serve the visualization locally
    displacy.serve(doc, style="ent", options={"page": True})




#%%


# File paths
cx = r"C:\Users\pqn7\temp\recipient-experience\data\original-free-text.docx"
output_file = r"C:/Users/pqn7/temp/recipient-experience/data/original-free-text-annotated.html"

# Extract text, process, and save HTML
text = extract_text_with_mammoth(cx)
annotate_and_generate_html(text, output_file)

print(f"Annotated document saved as HTML: {output_file}")

# %%
