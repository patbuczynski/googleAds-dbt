SELECT 
CampaignId,
CreativeId, 
regexp_replace(CreativeFinalUrls, r"\[|\]|\"", "") FinalUrl 
FROM {{var('t_ads')}}
GROUP BY 1,2,3