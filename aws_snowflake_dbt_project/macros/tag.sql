{% macro tag(col) %}
    Case
        when {{col}} < 100 then 'LOW'
        when {{col}} >= 100 and {{col}} < 500 then 'MEDIUM'
        else 'NOT NULL'
    end


{% endmacro %}