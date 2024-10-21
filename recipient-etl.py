# author: alan hamm(pqn7) with AI assisted programming( parse_dates() function )
# date: october 2024

#%%
import pandas as pd
from datetime import datetime


survey_csv = 'C:/Users/pqn7/OneDrive - CDC/projects/recipient-experience/from_chad/cdc_cfi_complete_20240827.csv'

#%%
# resources: google search: pandas read_csv not reading "seconds" using AI Overview to parse date with time
#            chatCDC: add parsing multiple date formats
def parse_dates(x):
    """ function to convert datetime into pandas datetime"""
    for fmt in ("%Y-%m-%d %H:%M:%S", "%A, %B %d, %Y"):
        try:
            return pd.to_datetime(x, format=fmt)
        except ValueError:
            continue
    raise ValueError('no valid date format found')


#%%
# Define which columns will be retained from each dataset out of the possibilities

# Grant/Cooperative Agreement Selection
UTILS = [
    'WRESPID',	
    'DATSTART',	
    'DATEND'
]

# Define the datatype mapping
UTILS_DTYPE = {
    'WRESPID': int,
    'DATSTART': str,
    'DATEND': str
}


# Application and Award Processes
AP1 = [
    'APPC_WEB',   # AP1a - Notice of Funding Opportunity (NOFO) presentation/Informational webinar
    'APPC_FAQ',   # AP1b - Frequently Asked Questions (FAQs) about the NOFO
    'APPC_STF',   # AP1c - CDC staff identified in the CDC NOFO
    'APPC_INF'    # AP1d - Information on the CDC website about the NOFO
]
AP2 = [
    'APP_CLAR',        # AP2 - Clarity of application instructions in NOFO
    'APP_DETL' ,       # AP3 - Amount of detail provided in the NOFO to understand CDC's expectations for implementing the project
    'APP_TIME',        # AP4 - Time given to develop and submit the application
    'APP_PREP',        # AP5 - Ease of preparing the application content
    'APP_SBMT',        # AP6 - Ease of submitting the application via online platform
    'APP_SPRT'        # AP7 - Helpfulness of support you received on questions about the application process
]
APP_NOTCLASSIFIED =[
    'APP_SCORE',	# Application Process Driver Score
    'APP_DETL_SCORE',	# Amount of detail provided
    'APP_TIME_SCORE',	# Time given to develop and submit
    'APP_PREP_SCORE',	# Ease of preparing content
    'APP_SBMT_SCORE'	# Ease of submitting via online platform
]
# For the following questions, please think about your experiences with the [GRANT PROGRAM] AWARD PROCESS
GA = [
    'AWPC_UND',    # GA1 - Ease of understanding the terms and conditions outlined in the Notice of Award (NOA)
    'AWPC_CNT',    # GA2 - Ease of reaching CDC personnel with questions, issues, or concerns about the award process
    'AWPC_RSP',    # GA3 - Timeliness of responses to your questions about the award
    'AWPC_FDB',    # GA4 - Helpfulness of feedback provided in responses to your questions about the award
    'AWPC_CNS',    # GA5 - Consistency of feedback provided in responses to your questions about the award (e.g., by multiple CDC personnel or over time)
    'AWPC_REC',    # GA6 - Timeliness of receiving the NOA
    'TCH_CLAR',    # GA7a - Clarity of recommendations for changes to the work plan
    'TCH_ASST',    # GA7b - Assistance provided by CDC in making changes to the work plan
    'TCH_TIME',    # GA7c - Time given to make required changes to the work plan
    'TCH_CNST',    # GA7d - Consistency of comments and feedback (e.g., by multiple CDC personnel or over time)
    'TCH_HELP',     # GA7e - Helpfulness of the information provided in the review
    'PROCESS_TEXT_RAW', 	# GA8 - What can CDC do to improve the application and award process? Please be specific.
    'PROCESS_TEXT_CLEAN',	# Edited for PII_What can CDC do to improve the application and award process? Please be specific.
    'PROCESS_CODE1',	# Codified Category for What can CDC do to improve the application and award process? Please be specific.
    'PROCESS_CODE2',	# Codified Category for What can CDC do to improve the application and award process? Please be specific.
    'PROCESS_CODE3'	# Codified Category for What can CDC do to improve the application and award process? Please be specific.
]
# Define the datatype mapping
GA_DTYPE = {
    'PROCESS_TEXT_RAW': str,
    'PROCESS_TEXT_CLEAN': str,
    'PROCESS_CODE1': str,
    'PROCESS_CODE2': str,
    'PROCESS_CODE3': str,
}

# Monitoring and Reporting
MONITORING_AND_REPORTING = [
    'MNT_CLAR',	# M1 - Clarity of monitoring requirements
    'MNT_REQR',	# M2 - Reasonableness of monitoring requirements
    'MNT_CNTC',	# M3 - Ease of reaching CDC personnel with questions or concerns about monitoring activities
    'MNT_INTR',	# M4 - Helpfulness of interaction(s) with CDC personnel while engaged in monitoring activities
    'MNT_USEP',   # M5 -	Ease of using the required online platform(s) for monitoring activities
    'MNT_GUID',	# M6 - Consistency of guidance from CDC personnel related to monitoring activities (e.g., by multiple CDC personnel or over time)
    'D_SITVIS',	# M7 - In the past 12 months, have you participated in a CDC site visit for this grant or cooperative ag...
    'SITE_TIM',    # SV1 -
    'SITE_HPO',    # SV2 - 
    'SITE_GMS',    # SV3 - 
    'SITE_USE',    # SV4 - 
    'D_PREP',      # SV5 - 
    'D_FLWUP',     # SV6 - 
    'SITEVISIT_TEXT_RAW',	# What can CDC do to improve future site visit experiences, including necessary preparation and fol...
    'SITEVISIT_TEXT_CLEAN',	# Edited for PII_What can CDC do to improve future site visit experiences, including necessary preparation and fol…
    'SITEVISIT_CODE1',	# Codified Category for What can CDC do to improve future site visit experiences, including necessary preparation and fol…
    'SITEVISIT_CODE2',	# Codified Category for What can CDC do to improve future site visit experiences, including necessary preparation and fol…
    'SITEVISIT_CODE3',	# Codified Category for What can CDC do to improve future site visit experiences, including necessary preparation and fol…
    'REP_CLAR',     # R1 - Clarity of reporting requirements
    'REP_ORG',      # R2 - Ease of gathering and organizing the data/information required for reporting to CDC
    'REP_CNTC',     # R3 - Ease of reaching CDC personnel with questions or concerns about reporting requirements
    'REP_INTR',     # R4 - Helpfulness of interaction(s) with CDC personnel while engaged in reporting requirements
    'REP_SBMT',     # R5 - Ease of submitting reports to CDC via online platform(s)
    'REP_UFIN',     # R6 - Usefulness of CDC feedback on financial reports
    'REP_GUID',     # R7 - Consistency of guidance from CDC personnel related to reporting requirements (e.g., by multiple CDC personnel or over time)
    'REP_UPRG',     # R8 - Usefulness of CDC feedback on program reports
    'D_RPAMNT',     # R9 - The amount of reporting required for this grant or cooperative agreement, apart from the Federal...
    'D_NEWREP',    # R10 - Did CDC add new or additional reporting requirements during the award period beyond what was in t...
    'REPORT_TEXT_RAW',	# R11 - What can CDC do to improve the monitoring or reporting requirements for this grant or cooperative...
    'REPORT_TEXT_CLEAN',	# Edited for PII What can CDC do to improve the monitoring or reporting requirements for this grant or cooperative...
    'REPORT_CODE1',	# Codified Category for What can CDC do to improve the monitoring or reporting requirements for this grant or cooperative…
    'REPORT_CODE2',	# Codified Category for What can CDC do to improve the monitoring or reporting requirements for this grant or cooperative…
    'REPORT_CODE3'	# Codified Category for What can CDC do to improve the monitoring or reporting requirements for this grant or cooperative…
]
# Define the datatype mapping
MONITORING_AND_REPORTING_DTYPE = {
    'SITEVISIT_TEXT_RAW': str,
    'SITEVISIT_TEXT_CLEAN': str,
    'SITEVISIT_CODE1': str,
    'SITEVISIT_CODE2': str,
    'SITEVISIT_CODE3': str,
    'REPORT_TEXT_RAW': str,
    'REPORT_TEXT_CLEAN': str,
    'REPORT_CODE1': str,
    'REPORT_CODE2': str,
    'REPORT_CODE3': str,
}

# Training and Technical Assistance
TRAINING_AND_TECHNICAL_ASSISTANCE = [
    'D_TRAIN',	    # TTA1 - Have you received training or technical assistance (such as webinars, online courses, in-person t...
    'NOTRN_1',	    # TTA2a - What are the reasons you have not received training or technical assistance for this grant or coo...
    'NOTRN_2',	    # TTA2b - What are the reasons you have not received training or technical assistance for this grant or coo...
    'NOTRN_3',        # TTA2d - What are the reasons you have not received training or technical assistance for this grant or coo..
    'NOTRN_4',	    # TTA2d  - What are the reasons you have not received training or technical assistance for this grant or coo...
    'NOTRN_97',	    # TTA2e - What are the reasons you have not received training or technical assistance for this grant or coo...
    'NOTRN_97_Other',	# TTA2e - What are the reasons you have not received training or technical assistance for this grant or coo...
    'TOPIC_1',	        # TTA3a - On which of the following topics have you received CDC training or technical assistance for this...
    'TOPIC_2',	        # TTA3b - On which of the following topics have you received CDC training or technical assistance for this...
    'TOPIC_3',	        # TTA3c - On which of the following topics have you received CDC training or technical assistance for this...
    'TOPIC_4',
    'TOPIC_97',	    # TTA3e - On which of the following topics have you received CDC training or technical assistance for this...
    'TOPIC_97_Other',	# TTA3e -On which of the following topics have you received CDC training or technical assistance for this...
    'TRN_REQ',        # T1 - Ease of requesting training or technical assistance
    'TRN_RESP',	    # Responsiveness of CDC personnel to your requests for training and technical assistance
    'TRN_ADRS',	    # Ability of CDC personnel to address your concerns or direct you to helpful resources
    'TRN_TIME',	    # Timeliness of training and technical assistance delivered
    'TRN_USE',	        # Usefulness of training and technical assistance delivered
    'TRN_CNST',	        # Consistency of training and technical assistance delivered (e.g., by multiple providers or over time)
    'TRAINING_TEXT_RAW',	# What can CDC do to improve the training and technical assistance?
    'TRAINING_TEXT_CLEAN',	# Edited for PII What can CDC do to improve the training and technical assistance?
]
TRAINING_AND_TECHNICAL_ASSISTANCE_DTYPE = {
    'TOPIC_97_Other': str,
    'TRAINING_TEXT_RAW': str,
    'TRAINING_TEXT_CLEAN': str,
    'TRAINING_CODE1': str,
    'TRAINING_CODE2': str,
    'TRAINING_CODE3': str
}
# training and technical assistance not classified
TTA_NOTCLASSIFIED = [
    'TRAINING_CODE1',	    # Codified Category for What can CDC do to improve the training and technical assistance?
    'TRAINING_CODE2',	    # Codified Category for What can CDC do to improve the training and technical assistance?
    'TRAINING_CODE3',	    # Codified Category for What can CDC do to improve the training and technical assistance?
    'TTA_SCORE',	# Training & Technical Assistance Driver Score
    'TTA_REQ',	    # Ease of requesting training or technical assistance
    'TTA_RESPON',	# Responsiveness of CDC to requests
    'TTA_ADDRESS',	# Ability of CDC to address concerns/help
    'TTA_TIME',	    # Timeliness of training and technical assistance delivered
    'TTA_CONSIST'	# Consistency of training and technical assistance delivered
]

# Communication
COMMUNICATION = [
    'COM_TIME',	# C1 - Timeliness of program communications that include actions you need to take
    'COM_LANG',	# C2 - Use of plain language in program communications
    'COM_CNST',	# C3 - Consistency of information provided about this program across different communication channels
    'COM_INFO',	# C4 - Usefulness of information provided by CDC for program awareness
    'SRC_POC',  # Project officer communication you receive
    'SRC_GMS',  # Grants management specialist communication you receive
    'SRC_GCOM', # General program communications (e.g., newsletters or program listservs) you receive
    'SRC_NOTF', # Grant management system-generated notifications you receive
    'D_AMNTCM' ,# The amount of communication for this grant or cooperative agreement is:
    'COMMNCTN_TEXT_RAW',	# C10 - What can CDC do to improve its communication efforts related to this grant or cooperative agreeme...
    'COMMNCTN_TEXT_CLEAN',	# Edited for PII What can CDC do to improve its communication efforts related to this grant or cooperative agreeme...
    'COMMNCTN_CODE1',	# Codified Category for What can CDC do to improve its communication efforts related to this grant or cooperative agreeme...
    'COMMNCTN_CODE2',	# Codified Category for What can CDC do to improve its communication efforts related to this grant or cooperative agreeme...
    'COMMNCTN_CODE3',	# Codified Category for What can CDC do to improve its communication efforts related to this grant or cooperative agreeme...
    'COMM_SCORE',	# Communication Driver Score
    'COMM_TIME',	# Timeliness of communications and actions
    'COMM_PLAIN',	# Use of plain language in communications
    'COMM_CONSIST'	# Consistency across communication channels
]
# Define the datatype mapping
COMMUNICATION_DTYPE = {
    'COMMNCTN_TEXT_RAW': str,
    'COMMNCTN_TEXT_CLEAN': str,
    'COMMNCTN_CODE1': str,
    'COMMNCTN_CODE2': str,
    'COMMNCTN_CODE3': str
}

# partnership
PARTNERSHIP = [
    'PRT_JRSD',	# P1 - CDC’s understanding of needs and context specific to your organization
    'PRT_ORG',	    # P2 - CDC’s understanding of needs and context specific to your jurisdiction
    'PRT_TRNS',	# P3 - Openness and transparency of CDC personnel about upcoming changes or issues that will affect your grant/cooperative agreement
    'PRT_BLNC',	# P4 -CDC personnel's ability to balance the interests and needs of your organization or program with the interests and needs of CDC
    'PRT_RESP',	# P5 - CDC personnel's level of respect for me and my organization as an important partner
    'PRTNRSHP_TEXT_RAW',	# What can CDC do to improve its partnership with you and your organization? Please be specific and...
    'PRTNRSHP_TEXT_CLEAN',	# Edited for PII What can CDC do to improve its partnership with you and your organization? Please be specific and...
    'PRTNRSHP_CODE1',	# Codified Category for What can CDC do to improve its partnership with you and your organization? Please be specific and...
    'PRTNRSHP_CODE2',	# Codified Category for What can CDC do to improve its partnership with you and your organization? Please be specific and...
    'PRTNRSHP_CODE3',	# Codified Category for What can CDC do to improve its partnership with you and your organization? Please be specific and...
    'D_WRKPO',	    # How long have you worked with your current CDC PO for this grant or cooperative agreement?
    'D_CNTPO',	    # Approximately, how often do you have contact with your CDC PO for this grant or cooperative agree...
    'D_FRQPO',	    # Is the frequency of contact with your PO for this grant or cooperative agreement:
    'CDCPO_TEXT_RAW',	# What can CDC do to improve the PO support you receive for this grant or cooperative agreement? Pl...
    'CDCPO_TEXT_CLEAN',	# Edited for PII What can CDC do to improve the PO support you receive for this grant or cooperative agreement? Pl...
    'CDCPO_CODE1',	# Codified, # Category for What can CDC do to improve the PO support you receive for this grant or cooperative agreement? Pl...
    'CDCPO_CODE2',	# Codified, # Category for What can CDC do to improve the PO support you receive for this grant or cooperative agreement? Pl...
    'CDCPO_CODE3',	# Codified,  # Category for What can CDC do to improve the PO support you receive for this grant or cooperative agreement? Pl...
    'D_WRKGMS',	# How long have you worked with your current CDC GMS for this grant or cooperative agreement?
    'D_CNTGMS',	# Approximately, how often do you have contact with your CDC GMS for this grant or cooperative agre...
    'D_FRQGMS',	# Is the frequency of contact with your CDC GMS for this grant or cooperative agreement:
    'D_GUID',       # How often do you receive guidance from your PO that is different from the guidance you receive fr...
    'TRNVR_1', # Experienced PO or GMS turnover
    'TRNVR_2', # Experienced PO or GMS turnover
    'TRNVR_3', # Experienced PO or GMS turnover
    'TRNVR_98', # Experienced PO or GMS turnover
    'D_POGUID', # Frequency of receiving guidance from NEW PO
    'D_GMSGUD', # Frequency of receiving guidance from NEW GMS
    'BDG_CHNG', # Adapt to the changing needs
    'BDG_HIRE', # Hire the types of staff needed
    'BDG_ACTV' # Adapt activities to meet emergent needs
]
# Define the datatype mapping
PARTNERSHIP_DTYPE = {
    'PRTNRSHP_TEXT_RAW': str,
    'PRTNRSHP_TEXT_CLEAN': str,
    'PRTNRSHP_CODE1': str,
    'PRTNRSHP_CODE2': str,
    'PRTNRSHP_CODE3': str,
    'CDCPO_TEXT_RAW': str,
    'CDCPO_TEXT_CLEAN': str,
    'CDCGMS_CODE1': str,
    'CDCGMS_CODE2': str,
    'CDCGMS_CODE3': str
}

# ACSI Benchmarck(CSI)
ACIS_BENCHMARK = [
    'SAT_OVR',	# Your overall satisfaction with your grant or cooperative agreement experience
    'SAT_EXP',	# How well your experience with this grant or cooperative agreement has met your expectations
    'SAT_IDL'	# How close to your "ideal" grant experience your experience with this grant or cooperative agreement was
]

# futures and behaviors
FUTURES_AND_BEHAVIORS = [
    'OUT_SPRT',	# How much CDC's support improves your ability to achieve the goals and objectives of the grant program
    'OUT_TRST'	# How much you trust CDC's commitment to your success as a partner in achieving the goals and objectives of the grant or cooperative agreement
]

# suggestions for improvement
SUGGESTIONS_FOR_IMPROVEMENT = [
    'EXPRNC_TEXT_RAW', # If you could change one aspect of your experience with this grant or cooperative agreement, what...
    'EXPRNC_TEXT_CLEAN',	# Edited for PII If you could change one aspect of your experience with this grant or cooperative agreement, what...
    'EXPRNC_CODE1',	# Codified Category for If you could change one aspect of your experience with this grant or cooperative agreement, what...
    'EXPRNC_CODE2',	# Codified Category for If you could change one aspect of your experience with this grant or cooperative agreement, what...
    'EXPRNC_CODE3'	# Codified Category for If you could change one aspect of your experience with this grant or cooperative agreement, what...
]
# Define the datatype mapping
SUGGESTIONS_FOR_IMPROVEMENT_DTYPE = {
    'EXPRNC_TEXT_RAW': str,
    'EXPRNC_TEXT_CLEAN': str,
    'EXPRNC_CODE1': str,
    'EXPRNC_CODE2': str,
    'EXPRNC_CODE3': str
}


# overal
OVERALL = [
    'D_WRKDUR',	# How long have you worked on this grant or cooperative agreement?
    'D_PASTWK',	# How many CDC grants or cooperative agreements have you worked on in the past 5 years?
    'ADDTN_FDBK_TEXT_RAW',	# Think about your overall experience with the U.S. Centers for Disease Control and Prevention, acr...
    'ADDTN_FDBK_TEXT_CLEAN',	# Edited for PII Think about your overall experience with the U.S. Centers for Disease Control and Prevention, acr...
    'ADDTN_FDBK_CODE1',	# Codified Category for Think about your overall experience with the U.S. Centers for Disease Control and Prevention, acr...
    'ADDTN_FDBK_CODE2',	# Codified Category for Think about your overall experience with the U.S. Centers for Disease Control and Prevention, acr...
    'ADDTN_FDBK_CODE3'	# Codified Category for Think about your overall experience with the U.S. Centers for Disease Control and Prevention, acr...
]
# Define the datatype mapping
SUGGESTIONS_FOR_IMPROVEMENT_DTYPE = {
    'ADDTN_FDBK_TEXT_RAW': str,
    'ADDTN_FDBK_TEXT_CLEAN': str,
    'ADDTN_FDBK_CODE1': str,
    'ADDTN_FDBK_CODE2': str,
    'ADDTN_FDBK_CODE3': str
}

# not in survey form
NOT_IN_SURVEY_FORM = [
    'CSI_INDEX',	    # Customer Satisfaction Index
    'CSI_OVER',	    # Overall Satisfaction
    'CSI_EXPECT',	    #Compared to Expectations
    'CSI_IDEA',	    #Compared to Ideal
    'OUT_TRUST',	# Trust CDC's commitment to success in achieving goals and objectives
    'OUT_GOAL',	# CDC's support improves ability to achieve goals and objectives
    'APP_SCORE',	# Application Process Driver Score
    'APP_DETL_SCORE',	# Amount of detail provided
    'APP_TIME_SCORE',	# Time given to develop and submit
    'APP_PREP_SCORE',	# Ease of preparing content
    'APP_SBMT_SCORE',	# Ease of submitting via online platform
    'MR_SCORE',	    # Monitoring & Reporting Driver Score
    'MR_CLARITY',	 # Clarity of monitoring/reporting requirements
    'MR_REASON',	# Reasonableness of monitoring requirements
    'MR_ONLINE',	# Ease of using the required online platform(s) for monitoring activities
    'MR_SUBMIT',	# Ease of submitting reports to CDC via online platform(s)
    'PART_SCORE',	# Partnership Driver Score
    'PART_UND',	    # Understanding of organization/jurisdiction needs
    'PART_OPEN',	# Openness and transparency upcoming changes or issues
    'PART_BAL',	    # Ability to balance between CDC and organization needs
    'SUPP_SCORE',	# Overall Support & Guidance Driver Score
    'SUPP_TIME',	# Timeliness of responses to your questions about the award
    'SUPP_REACH',	# Ease of reaching CDC for support/with questions
    'SUPP_HELP',	# Helpfulness of CDC support/feedback/personnel/interactions
    'SUPP_CONSIST',	# Consistency of support/guidance from CDC
    'SUPP_USEFUL',	# Usefulness of CDC feedback on program/financial reports
    'FLEX_SCORE',	# Flexibility Driver Score
    'FLEX_CHANGE',	# Adapt to the changing needs
    'FLEX_HIRE',	# Hire the types of staff needed
    'FLEX_EMERGE'	# Adapt activities to meet emergent needs
]

# grant vars not in distributed survey
GRANT = [
    'finalgrant',
    'grant1',
    'grant2',
    'grant3',
    'grant4',
    'grant5',
    'grant6',
    'grant7',
    'grant8',
    'grant9',
    'grant10'
]
# Define the datatype mapping
GRANT_DTYPE = {
    'finalgrant': str,
    'grant1': str,
    'grant1': str,
    'grant1': str,
    'grant1': str,
    'grant2': str,
    'grant3': str,
    'grant4': str,
    'grant5': str,
    'grant6': str,
    'grant7': str,
    'grant8': str,
    'grant9': str,
    'grant10': str
}

GENERAL_NOT_CLASSIFIED = [
    'CIO',	
    'NOFO_NUM',	
    'CFDA_NUM',	
    'DROPDWN',	
    'NOFO_SHORT',
    'FTYPE',
    'RESEARCH',
    'STLT_TYPE',
    'RECIP_TYPE_DETAIL',
    'ISSUED',
    'PP_START',
    'PP_END',
    'HHS_REGION',
    'NOFO_TITLE'
]
# Define the datatype mapping
GENERAL_NOT_CLASSIFIED_DTYPE = {
    'CIO': str,
    'NOFO_NUM': str,
    'CFDA_NUM': float,
    'DROPDWN': str,
    'NOFO_SHORT': str,
    'FTYPE': str,
    'RESEARCH': str,
    'STLT_TYPE': str,
    'RECIP_TYPE_DETAIL': str,
    'PP_START': str,
    'PP_END': str,
    'NOFO_TITLE': str,
    'grant9': str,
    'grant10': str
}

USE_COLS = UTILS + AP1 + AP2 + APP_NOTCLASSIFIED + GA 
USE_COLS = USE_COLS + MONITORING_AND_REPORTING 
USE_COLS = USE_COLS + TRAINING_AND_TECHNICAL_ASSISTANCE + TTA_NOTCLASSIFIED 
USE_COLS = USE_COLS + COMMUNICATION + PARTNERSHIP
USE_COLS = USE_COLS + ACIS_BENCHMARK + FUTURES_AND_BEHAVIORS + SUGGESTIONS_FOR_IMPROVEMENT + OVERALL
USE_COLS = USE_COLS + GRANT + NOT_IN_SURVEY_FORM + GENERAL_NOT_CLASSIFIED

COL_DTYPE = {**UTILS_DTYPE, **GA_DTYPE, **MONITORING_AND_REPORTING_DTYPE, **MONITORING_AND_REPORTING_DTYPE, \
             **TRAINING_AND_TECHNICAL_ASSISTANCE_DTYPE, **COMMUNICATION_DTYPE, **PARTNERSHIP_DTYPE, \
             **SUGGESTIONS_FOR_IMPROVEMENT_DTYPE, **GRANT_DTYPE, **GENERAL_NOT_CLASSIFIED_DTYPE }


#%%

survey = pd.read_csv(survey_csv, \
                     usecols=USE_COLS, \
                     dtype=COL_DTYPE
                     #,parse_dates=['DATSTART', 'DATEND','ISSUED', 'PP_START','PP_END'] \
                     #,date_parser=lambda x: pd.to_datetime(x, format="%Y-%m-%d %H:%M:%S")
                     #,date_parser=lambda x: parse_dates(x)
                )
# Pandas date_parser parameter is deprecated; must use date_format parameter
survey['DATSTART'] = parse_dates(survey['DATSTART'])
survey['DATEND'] = parse_dates(survey['DATEND'])
survey['ISSUED'] = parse_dates(survey['DATSTART'])
survey['PP_START'] = parse_dates(survey['DATEND'])
survey['PP_END'] = parse_dates(survey['DATSTART'])

survey.head()
# %%
