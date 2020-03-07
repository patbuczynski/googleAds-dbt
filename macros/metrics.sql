{% macro ctr() -%}

sum(clicks / NULLIF(impressions,0)) ctr

{%- endmacro %}

{% macro cpc() -%}

sum((cost/1000000) / NULLIF(clicks,0)) cpc

{%- endmacro %}

{% macro cost() -%}

sum(cost/1000000) cost

{%- endmacro %}

{% macro conversions() -%}

sum(Conversions) conversions

{%- endmacro %}

{% macro convRate() -%}

sum(Conversions / NULLIF(clicks,0)) convRate

{%- endmacro %}

{% macro costPerConv() -%}

sum(Conversions / NULLIF(clicks,0)) costPerConv

{%- endmacro %}


