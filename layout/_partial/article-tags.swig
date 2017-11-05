{% if item.tags && item.tags.length %}
{% for tag in item.tags.sort("name") %}
	{% if limit %}
		{% if loop.index <= limit %}
			<label><a href="{{ url_for(tag.path) }}">#{{ tag.name | capitalize }}</a></label>
		{% endif %}
	{% else %}
		<label><a href="{{ url_for(tag.path) }}">#{{ tag.name | capitalize }}</a></label>
	{% endif %}
{% endfor %}
{% endif %}