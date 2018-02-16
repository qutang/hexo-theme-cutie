
{% set menu = site.data.cutie.menu | default(theme.menu) %}

{% set icon_set = site.data.cutie.global.icon_set | default(theme.global.icon_set) %}
<nav id="nav">
	{% set count = false %}
	{% for menu_name, menu_content in menu %}
		{% if position === 'footer' %}
			{% if loop.index == 1 %}
				{% set count = true %}
			{% endif %}
		{% else %}
			{% if loop.index == 5 %}
				{% set count = true %}
			{% endif %}
		{% endif %}
		{% if not count %}
			<div class='nav-item'>
				{% if url.indexOf(menu_content.link) !== -1 %}
					<div class="nav-name active_page">
				{% else %}
					<div class="nav-name">
				{% endif %}
					<a class='nav-link' href="{{ menu_content.link }}">
						<span>{{ __(menu_name) }} </span>
					</a>
				</div>
			</div>
		{% endif %}
	{% endfor %}
	{% if is_post() %}
	<div class='nav-item' id='nav-item-toc'>
		{{ partial('_partial/toc') }}
	</div>
	{% endif %}
	<div class='nav-item' id='nav-item-archive'>
		{% if url.indexOf('/archives/') !== -1 %}
				<div class='nav-icon active_dot'>
				{% else %}
				<div class='nav-icon'>
				{% endif %}
			<a href="/archives/" title='{{ __("menu.archives") }}'>
			<img src="{{ '/images/icons/' + icon_set + '/archive.svg' }}" alt="">
			</a>
		</div>
	</div>
	<div class='nav-item' id='nav-item-search'>
		{% if url.indexOf('/search/') !== -1 %}
		<div class='nav-icon active_dot'>
		{% else %}
		<div class='nav-icon'>
		{% endif %}
			<a href="/search/" title='{{ __("menu.search") }}'>
			<img src="{{ '/images/icons/' + icon_set + '/search.svg' }}" alt="">
			</a>
		</div>
	</div>
	<div class="nav-item" id='nav-item-more'>
		<div class="nav-icon">
				<a href='#' onclick='onClickMenuIcon(event);' ontouchstart='onClickMenuIcon(event);'>
				<img src="{{ '/images/icons/' + icon_set + '/menu.svg' }}" alt="">
				</a>
		</div>
		<div class="nav-more-menu">
		{% for menu_name, menu_content in menu %}
			{% set use_item = true %}
			{% for cat in site.categories %}
				{% if url_for(menu_content.link) == url_for('/categories/' + cat.name + '/') %}
					{% set use_item = false %}
				{% endif %}
			{% endfor %}
		{% if use_item == true %}
			<div class='nav-more-item'>
					<div class="nav-name">
						<a class='nav-link' href="{{ menu_content.link }}">
							<span>{{ menu_name | capitalize }}</span>
						</a>
					</div>
			</div>
		{% endif %}
		{% endfor %}
		{% for cat in site.categories %}
		<div class='nav-more-item'>
				<div class="nav-name">
					<a class='nav-link' href="{{'/categories/' + cat.name + '/'}}">
						<span>{{ cat.name | capitalize }}</span>
					</a>
				</div>
		</div>
		{% endfor %}
	</div>
	</div>
</nav>
