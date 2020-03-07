 {% macro extract(v) -%}
extract({{v}} from date) {{v}}
{%- endmacro %}