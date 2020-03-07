SELECT
CreativeId, 
externalCustomerId, 
{{extract('ISOWEEK')}},
{{extract('month')}},
{{extract('year')}},
sum(Impressions) impr
FROM {{var('t_adStats')}}
GROUP BY 1,2,3,4,5