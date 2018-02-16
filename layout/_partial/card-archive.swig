
{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = true %}
{% else %}
{% set use_post_stats = false %}
{% endif %}

<div class='Card-archive' id='{{ url_for(item.path) }}' data-name='{{ item.title }}' data-version='{{ item.version }}'>
	<mark class='Card-badge' style='{visibility: "hidden"}'></mark>
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
					{% if item.external_link %}
						<li>{{ __('external_link') }}</li>
					{% else %}
					{% if use_post_stats %}
					<li><i class='fa fa-comments'></i> <span class='card-comment-count'>0</span></li>
					<li><i class="fa fa-eye"></i> <span class='card-visit-count'>0</span></li>
					{% endif %}
					{% endif %}
			</ul>
		</div>
	</div>
</div>
