<div class='Card-archive'>
	<div class="Card-body">
		<h3 class='Card-title'>
			{% if item.link || item.external_link %}
				<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
			{% else %}
				<a href="{{ url_for(item.path) }}">
			{% endif %}
			{{ titlecase(item.title) | default("No title") }}</a>
		</h3>
		<div class="Card-meta">
			<div class='Card-tags'>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</div>
			<ul>
					<li><i class='fa fa-calendar'></i> {{ item.date.format(config.date_format) }}</li>
					<li><i class='fa fa-comments'></i> 0</li>
					<li><i class="fa fa-users"></i> 0</li>
			</ul>
		</div>
	</div>
</div>
