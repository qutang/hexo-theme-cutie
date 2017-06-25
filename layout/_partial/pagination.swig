<div class='pagination'>
	{% if page.prev %}
		<div class="pagination-item">
			<a href="{{ url_for(page.prev_link) }}" class="prev"><b><</b></a>
		</div>
	{% endif %}
	{% set base_link = page.current_url.split(config.pagination_dir)[0] %}
	{% for page_number, dummy in Array(page.total) %}
		<div class="pagination-item">
			{% set number = parseInt(page_number) + 1 %}
			{% if number == page.current %}
				<span>{{ number }}</span>
			{% else %}
				{% if number == 1 %}
					<a href="{{ url_for(base_link) }}">{{ number }}</a>
				{% else %}
					<a href="{{ url_for(base_link + config.pagination_dir + '/' + number + '/') }}">{{ number }}</a>
				{% endif %}
			{% endif %}
		</div>
	{% endfor %}

	{% if page.next %}
		<div class="pagination-item">
			<a href="{{ url_for(page.next_link) }}" class="next"><b>></b></a>
		</div>
	{% endif %}
</div>