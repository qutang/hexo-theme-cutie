<div class="col">
	<div class='Card-archive'>
		<div class="Card-body">
			<p class='Card-title'>
				{% if item.external_link %}
					<a href="{{ item.external_link }}" rel="noopener noreferrer" target="_blank">
				{% else %}
					<a href="{{ url_for(item.path) }}">
				{% endif %}
				{{ titlecase(item.title) }}</a>
			</p>
			<small class="Card-meta">
				{{ item.date.format(config.date_format) }}
			</small>
		</div>
	</div>
</div>