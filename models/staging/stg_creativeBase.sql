SELECT 
CampaignId,
CreativeId, 
AdGroupId, 
{{extract('ISOWEEK')}},
{{extract('month')}},
{{extract('year')}},
Sum(Clicks) Clicks, 
{{cost()}}, 
{{conversions()}}
FROM {{var('t_adStats')}}
GROUP BY 1,2,3,4,5,6