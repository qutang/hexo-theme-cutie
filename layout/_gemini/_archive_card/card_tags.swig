{% if page_tags && page_tags.length %}
<div class="tags">
	<i class="fa fa-tags fa-lg"></i>
	{% for tag in item.tags.sort("name") %}
		{% if number_of_tags %}
			{% if loop.index <= number_of_tags %}
				<label class='tag-{{ loop.index }}'><a href="{{ url_for(tag.path) }}">{{ tag.name | capitalize }}</a></label>
			{% endif %}
		{% else %}
			<label class='tag-{{ loop.index }}'><a href="{{ url_for(tag.path) }}">{{ tag.name | capitalize }}</a></label>
		{% endif %}
	{% endfor %}
</div>
{% endif %}