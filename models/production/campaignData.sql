SELECT
cm.CampaignName, 
im.impr Impressions,
cb.*,
cc.Conversions,
cc.conv1, 
cc.conv2, 
cc.conv3,
(sum(cb.clicks) / sum(im.impr)) ctr,
(sum(cb.cost) / sum(NULLIF(cb.clicks,0))) cpc,
(sum(cc.Conversions) / sum(NULLIF(cb.clicks,0))) convRate,
(sum(cb.Cost) / sum(NULLIF(cc.Conversions, 0))) costPerConv
FROM {{ref('stg_campaignBase')}} cb
JOIN {{ref('stg_campaignLookup')}} cm
ON cb.campaignId = cm.campaignId
LEFT JOIN {{ref('stg_campaignImpressions')}} im
ON cb.campaignId = im.campaignId 
AND cb.externalCustomerId = im.externalCustomerId
AND cb.ISOWEEK = im.ISOWEEK
AND cb.month = im.month
AND cb.year = im.year
LEFT JOIN {{ref('stg_campaignConversions')}} cc
ON cb.campaignId = cc.campaignId
AND cb.ISOWEEK = cc.ISOWEEK
AND cb.month = cc.month
AND cb.year = cc.year
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13
