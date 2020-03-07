<h1> Google Ads models </h1>

dbt data models for Google Ads data (exported to BigQuery via Google Data Transfer) transformation. 

<h2> Models </h2>
  
  The primary outputs of this page are: adGroupData, campaignData, textAds, creativeUrl. There are several intermediate models used to create these two models. 

| Model | Description |
|--|--|
| adGroupData | Google Ads ad group data with base metrics (clicks, impressions, cost, cpc...) |
| campaignData | Google Ads campaign data with base metrics (clicks, impressions, cost, cpc...) |
| creativeUrl| Base metrics on the creative level with final url |
| textAds | Text ads without statistics |

<h2> Installation instructions </h2>

https://docs.getdbt.com/docs/installation
  
<h2> Configuration instructions </h2>
  
  These variables in dbt_project.yml are needed to configure the models: 
  
  | Var | Description | Required |
|--|--|--|
| t_campaignStats | Full name of p_campaignStats table from Google Ads data export (dataset id included) |
| t_campaign| Full name of p_Campaign table from Google Ads data export (dataset id included) |
| t_ads | Full name of p_Ad table from Google Ads dgit ata export (dataset id included) |
| t_adStats | Full name of p_AdBasicStats table from Google Ads data export (dataset id included) |
| t_campaignConv | Full name of p_CampaignConversionStats table from Google Ads data export (dataset id included) |
| t_adGroupStats | Full name of p_AdGroupStats table from Google Ads data export (dataset id included) |
| t_adGroup | Full name of p_AdGroup table from Google Ads data export (dataset id included) |
| t_adGroupConv | Full name of p_AdGroupConv table from Google Ads data export (dataset id included) |
| convName1 | Name of first conversion defined in Google Ads |
| convName2 | Name of second conversion defined in Google Ads |
| convName3 | Name of third conversion defined in Google Ads |

Example dbt_project.yml configuration: 

<pre>
models:
        gadslh:
                production: 
                        materialized: table
                staging:
                        materialized: ephemeral
        vars: 
                t_campaignStats: '`datasetID_google_ads.p_CampaignStats_accountNumber`'
                t_campaign: '`datasetID_google_ads.p_Campaign_accountNumber`'
                t_ads: '`datasetID_google_ads.p_Ad_accountNumber`'
                t_adStats: '`datasetID_google_ads.p_AdBasicStats_accountNumber`'
                t_campaignConv: '`datasetID_google_ads.p_CampaignConversionStats_accountNumber`'
                t_adGroupStats: '`datasetID_google_ads.p_AdGroupStats_accountNumber`'
                t_adGroup: '`datasetID_google_ads.p_AdGroup_accountNumber`'
                t_adGroupConv: '`datasetID_google_ads.p_AdGroup_accountNumber`'
                convName1: '"name of first conversion"'
                convName2: '"name of second conversion"'
                convName3: '"name of third conversion"'
  </pre>
  

  
