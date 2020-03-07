SELECT 
CampaignId,
CreativeId, 
AdGroupId, 
HeadlinePart1, 
HeadlinePart2,
ExpandedTextAdHeadlinePart3,
Description,
ExpandedTextAdDescription2
FROM {{var('t_ads')}}
WHERE HeadlinePart1 is not null
GROUP BY 1,2,3,4,5,6,7,8