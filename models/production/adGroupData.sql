SELECT
cm.CampaignName, 
al.AdGroupName, 
im.impr, 
ab.*, 
ac.Conversions,
ac.conv1, 
ac.conv2, 
ac.conv3,
(sum(ab.clicks) / sum(NULLIF(im.impr,0))) ctr,
(sum(ab.cost) / sum(NULLIF(ab.clicks,0))) cpc,
(sum(ac.Conversions) / sum(NULLIF(ab.clicks,0))) convRate,
(sum(ab.Cost) / sum(NULLIF(ac.Conversions, 0))) costPerConv
FROM {{ref('stg_adGroupBase')}} ab
LEFT JOIN {{ref('stg_adGroupImpressions')}} im
ON ab.AdGroupId = im.AdGroupId 
AND ab.ISOWEEK = im.ISOWEEK
AND ab.month = im.month
AND ab.year = im.year
JOIN {{ref('stg_adGroupLookup')}} al
ON ab.AdGroupId = al.AdGroupId
JOIN {{ref('stg_campaignLookup')}} cm
ON ab.campaignId = cm.campaignId
LEFT JOIN {{ref('stg_adGroupConversions')}} ac
ON ab.AdGroupId = ac.AdGroupId
AND ab.ISOWEEK = ac.ISOWEEK
AND ab.month = ac.month
AND ab.year = ac.year
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14

