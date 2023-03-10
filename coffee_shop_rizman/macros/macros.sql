{% macro product_categories_list() %}
{{ return (['coffee beans', 'merch', 'brewing supplies'])}}
{% endmacro %}


{% test is_not_free(model, column_name) %}
SELECT 
{{ column_name }}
FROM {{model}}
where {{column_name}} is null
or {{column_name}} < 0
{% endtest %}