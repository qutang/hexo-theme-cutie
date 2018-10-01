{% if item.categories && item.categories.length %} 
    {% for cat in item.categories %} 
        {% if loop.first %} 
            {% set category_name = cat.name %} 
        {% endif %} 
    {% endfor %} 
{% else %}
    {% set category_name = "Uncategorized" %} 
{% endif %}

{{ category_name }}