{% if item.tags && item.tags.length %}
<div class="tags">
	{% for tag in item.tags.sort("name") %}
		{% if limit %}
			{% if loop.index <= limit %}
				<label class='tag-{{ loop.index }}'><a href="{{ url_for(tag.path) }}">{{ tag.name | capitalize }}</a></label>
			{% endif %}
		{% else %}
			<label class='tag-{{ loop.index }}'><a href="{{ url_for(tag.path) }}">{{ tag.name | capitalize }}</a></label>
		{% endif %}
	{% endfor %}
	</div>
{% endif %}