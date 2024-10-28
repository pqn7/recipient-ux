#%%
# import packages 
import pandas as pd 
import numpy as np
from recipient import *
  
# reading csv file  
survey_csv = 'C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cfi-raw-data.csv'
SURVEY = read_csi(survey_csv) 


#%% NOTE: calculate Completes and RR columns until get full data

# Table 1: Response Rates by STLT
stlt_invites = {'State Health Department or Delegate': 1358, 
                'Tribal Health Department or Delegate': 136,  
                'Local Health Department or Delegate': 453, 
                'U.S. Territories and Freely Associated States': 85}

stlt_table = pd.DataFrame(stlt_invites, index=['INVITES'])
stlt_table=stlt_table.transpose()
stlt_table = stlt_table.rename(columns={'index': 'STLT_TYPE'})


# clean data values
SURVEY['STLT_TYPE'] = SURVEY['STLT_TYPE'].replace('U.S. Territory or API', 'U.S. Territories and Freely Associated States')


stlt_completes = SURVEY.groupby('STLT_TYPE')['STLT_TYPE'].count()

stlt = pd.merge(stlt_table, stlt_completes, how='outer', left_index=True, right_index=True)
stlt = stlt.rename(columns={'STLT_TYPE': 'COMPLETE'})
stlt['RESPONSE RATE'] = round(stlt['COMPLETE'] / stlt['INVITES'] * 100).astype(int)
print(stlt)


# %%
