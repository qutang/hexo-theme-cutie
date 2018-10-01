
{% set slogan = parse_config([site.data.cutie.slogan, theme.slogan]) %}
{% set home_url = url_for(page.path) %}
{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}

<div class="home-container" id='{{ home_url }}' data-name='home' data-version='{{ theme.version }}'>
	{% block home %}
		<div class='home-slogan'>
			{{ slogan }}
		</div>
		<div class="home-cards">
		{% for post in page.posts %}
			{{ partial('_scheme_switcher/_card', {item: post, card_index: loop.index, scheme_name: scheme_name}) }}
		{% endfor %}
		</div>
	{% endblock %}
	{{ partial('_pagination/layout', {page: page}) }}
</div>