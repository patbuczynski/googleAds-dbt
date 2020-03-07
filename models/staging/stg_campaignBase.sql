SELECT 
campaignId,
externalCustomerId,
{{extract('ISOWEEK')}},
{{extract('month')}},
{{extract('year')}},
sum(clicks) Clicks, 
{{cost()}}
FROM {{var('t_campaignStats')}}
GROUP BY 1,2,3,4,5
