 {% macro margin_percent(revenue, purchase_cost) %}
     ROUND(safe_divide({{revenue}}-{{purchase_cost}},{{revenue}}),2)
 {% endmacro %}