{% if item.categories && item.categories.length %}
{% for cat in item.categories.sort("name") %}
	<a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
{% endfor %}
{% endif %}