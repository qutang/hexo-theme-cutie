<div class="col">
	<div class='Card-archive'>
		<div class="Card-body">
			<p class='Card-title'>
				{% if item.link || item.external_link %}
					<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
				{% else %}
					<a href="{{ url_for(item.path) }}">
				{% endif %}
				{{ titlecase(item.title) | default("No title") }}</a>
			</p>
			<small class="Card-meta">
				{{ item.date.format(config.date_format) }}
			</small>
		</div>
	</div>
</div>