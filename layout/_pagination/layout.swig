{% set base_link = page.current_url.split(config.pagination_dir)[0] %}

<div class='pagination'>
	{% if page.prev %}
		<div class="pagination-item">
			<a href="{{ url_for(page.prev_link) }}" class="pagination-prev-link"><b><i class='fa fa-arrow-circle-left fa-lg'></i></b></a>
		</div>
	{% endif %}
	
	{% for page_number, dummy in Array(page.total) %}
		<div class="pagination-item">
			{% set number = parseInt(page_number) + 1 %}
			{% if number == page.current %}
				<span class='pagination-page'>{{ number }}</span>
			{% else %}
				{% if number == 1 %}
					<a class='pagination-page-link' href="{{ url_for(base_link) }}">{{ number }}</a>
				{% else %}
					<a class='pagination-page-link' href="{{ url_for(base_link + config.pagination_dir + '/' + number + '/') }}">{{ number }}</a>
				{% endif %}
			{% endif %}
		</div>
	{% endfor %}

	{% if page.next %}
		<div class="pagination-item">
			<a href="{{ url_for(page.next_link) }}" class="pagination-next-link"><b><i class="fa fa-arrow-circle-right fa-lg"></i></b></a>
		</div>
	{% endif %}
</div>