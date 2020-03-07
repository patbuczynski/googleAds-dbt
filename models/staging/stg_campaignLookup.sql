SELECT
campaignId, 
cName campaignName
FROM (SELECT 
campaignId, 
LAST_VALUE(campaignName) OVER(PARTITION BY campaignId order by _PARTITIONTIME asc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cName
FROM {{var('t_campaign')}}
GROUP BY 1, _partitiontime, campaignName)
GROUP BY 1, 2
ORDER BY 1 DESC