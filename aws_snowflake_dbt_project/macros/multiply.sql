{% macro multiply(x, y, precision) %}
    {% set expression = "round(" ~ x ~ " * " ~ y ~ ", " ~ precision ~ ")" %}
    {{ return(expression) }}

{% endmacro %}