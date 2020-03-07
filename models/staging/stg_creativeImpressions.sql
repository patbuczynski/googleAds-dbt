SELECT
CreativeId, 
externalCustomerId, 
{{extract('ISOWEEK')}},
{{extract('month')}},
{{extract('year')}},
sum(Impressions) impr
FROM {{var('t_adStats')}}
WHERE clickType = "URL_CLICKS"
GROUP BY 1,2,3,4,5