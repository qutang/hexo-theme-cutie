{% if item.tags && item.tags.length %}
{% for tag in item.tags.sort("name") %}
	<label><a href="{{ url_for(tag.path) }}">#{{ tag.name | capitalize }}</a></label>
{% endfor %}
{% endif %}