SELECT 
AdGroupId, 
externalCustomerId,
{{extract('ISOWEEK')}},
{{extract('month')}},
{{extract('year')}},
SUM(Conversions) Conversions,
SUM(CASE WHEN ConversionTypeName = {{var('convName1')}} THEN Conversions ELSE 0 END) as conv1,
SUM(CASE WHEN ConversionTypeName = {{var('convName2')}} THEN Conversions ELSE 0 END) as conv2,
SUM(CASE WHEN ConversionTypeName = {{var('convName3')}} THEN Conversions ELSE 0 END) as conv3
FROM {{var('t_adGroupConv')}}
GROUP BY 1,2,3,4,5