<div class="col">
	<div class='Card Card-hover' id='{{ url_for(item.path) }}' data-name='{{ item.title }}' data-version='{{ item.version }}'>
		{% if item.categories && item.categories.length %}
			{% for cat in item.categories %}
				{% if loop.first %}
					{% set category_link = url_for(cat.path) %}
					{% set category_name = cat.name %}
				{% endif %}
			{% endfor %}
		{% else %}
			{% set category_link = url_for(item.path) %}
			{% set category_name = "uncategorized" %}
		{% endif %}
		<mark class='Card-badge' style='{visibility: "hidden"}'></mark>
		<div class='Card-figure'>
			{% if item.link || item.external_link %}
				<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank" onclick="setVisitedVersion('{{ item.title }}', '{{item.version}}' );setVersionBadgeForIndexPages();">
			{% else %}
				<a href="{{ url_for(item.path) }}">
			{% endif %}
			{% if item.icon %}
				<img class='grow' src="{{ item.icon }}" alt="">
			{% else %}
				<img class='grow' src="{{ '/images/' + category_name + '.svg' }}" alt="">
			{% endif %}
			</a>
		</div>
		<div class="Card-body">

				<div class='Card-title'>
					<h2>
					{% if item.link || item.external_link %}
						<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank" onclick="setVisitedVersion('{{ item.title }}', '{{item.version}}' );setVersionBadgeForIndexPages();">
					{% else %}
						<a href="{{ url_for(item.path) }}">
					{% endif %}
					{{ titlecase(item.title) | default("No title") }}</a></h2>
					<p class='Card-title-tags'>{{ partial('_partial/article-tags', {item: item}) }}</p>
				</div>
				<div class='Card-excerpt'>
					<p>
					{% if item.link || item.external_link %}
						<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank" onclick="setVisitedVersion('{{ item.title }}', '{{item.version}}' );setVersionBadgeForIndexPages();">
					{% else %}
						<a href="{{ url_for(item.path) }}">
					{% endif %}
					{% set exerpt = trim(truncate(strip_html(item.content), {length: 180, separator: ' ', omission: '...'})) %}
					{% if exerpt and exerpt !== '' %}
						{{ exerpt }}
					{% else %}
						{{ "No content" }} 
					{% endif %}
					</a></p>
					<p>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</p>
				</div>
				<div class="Card-meta">
					<p>{{ item.date.format(config.date_format) }}</p>
				</div>
			</a>
		</div>
	</div>
</div>