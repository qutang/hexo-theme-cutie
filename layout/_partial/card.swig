
{% if config.language[0] === 'zh-cn' || config.language[0] === 'zh-tw' %}
	{% set year = item.date.format('YYYY') %}
	{% set month = item.date.format('MM') %}
	{% set day = item.date.format('DD') %}
	{% set meta_date = year + '年' + month + '月' + day + '日' %}
{% else %}
{% set meta_date = item.date.format(config.date_format) %}
{% endif %}

{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = true %}
{% else %}
{% set use_post_stats = false %}
{% endif %}

<div class='Card Card-hover Card-index-{{ index }}' id='{{ url_for(item.path) }}' data-name='{{ item.title }}' data-version='{{ item.version }}'>
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
			<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
		{% else %}
			<a href="{{ url_for(item.path) }}">
		{% endif %}
		{% if item.icon %}
			<img class='grow' src="{{ item.icon }}" alt="" onerror='if(this.src != "/images/uncategorized.svg") this.src = "/images/uncategorized.svg"'>
		{% else %}
			<img class='grow' src="{{ '/images/' + category_name + '.svg' }}" alt="" onerror='if (this.src != "/images/uncategorized.svg") this.src = "/images/uncategorized.svg"'>
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
			</div>
			<div class='Card-excerpt'>
				<p>
				{% if item.link || item.external_link %}
					<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
				{% else %}
					<a href="{{ url_for(item.path) }}">
				{% endif %}
				{% set exerpt = trim(truncate(strip_html(item.content), {length: 150, separator: ' ', omission: '...'})) %}
				{% if exerpt and exerpt !== '' %}
					{{ exerpt }}
				{% else %}
					{{ "No content" }} 
				{% endif %}
				</a></p>
			</div>
			
			<div class="Card-meta">
				<div class='Card-tags'>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</div>
				<ul>
						<li><i class='fa fa-calendar'></i> {{ meta_date }}</li>
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
		</a>
	</div>
</div>