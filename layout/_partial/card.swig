<div class="col">
	<div class='Card Card-hover'>
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
		
		<div class='Card-figure'>
			{% if item.link || item.external_link %}
				<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
			{% else %}
				<a href="{{ url_for(item.path) }}">
			{% endif %}
			{% if item.icon %}
				<img src="{{ item.icon }}" alt="">
			{% else %}
				<img src="{{ '/images/' + category_name + '.svg' }}" alt="">
			{% endif %}
			</a>
		</div>
		<div class="Card-body">

				<div class='Card-title'>
					<h2>
					{% if item.link || item.external_link %}
						<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
					{% else %}
						<a href="{{ url_for(item.path) }}">
					{% endif %}
					{{ titlecase(item.title) | default("No title") }}</a></h2>
					<p class='Card-title-tags'>{{ partial('_partial/article-tags', {item: item}) }}</p>
				</div>
				<div class='Card-excerpt'>
					<p>
					{% if item.link || item.external_link %}
						<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
					{% else %}
						<a href="{{ url_for(item.path) }}">
					{% endif %}
					{{ strip_html(truncate(item.content, {length: 180, separator: ' ', omission: '...'}))|default("No content") }} </a></p>
					<p>{{ partial('_partial/article-tags', {item: item}) }}</p>
				</div>
				<div class="Card-meta">
					<p>{{ item.date.format(config.date_format) }}</p>
				</div>
			</a>
		</div>
	</div>
</div>