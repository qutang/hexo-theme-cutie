{% if site.data.cutie %}
	{% set logo = site.data['cutie']['logo'] | default(config.cutie.logo) %}
{% else %}
	{% set logo = config.cutie.logo %}
{% endif %}

<header class="header">
	<div class="header-title">
		{% if logo %}
			<div class='header-logo'><a href='/'>
				<img class='grow' src='{{ logo }}' />
			</a></div>
			<div class='header-text' >
			    <h1>{{ config.title }}</h1>
				<p><small>{{ truncate(config.subtitle, {length: 40, separator: ' ', omission: '...'}) }}</small></p>
			</div>
		{% else %}
			<div class='header-text-no-image'>
				<h1><a href="/">{{ config.title }}</a></h1>
				<p><small>{{ truncate(config.subtitle, {length: 40, separator: ' ', omission: '...'}) }}</small></p>
			</div>
			
		{% endif %}
	</div>
	<div id="header-menu-container">
		{{ partial('_partial/menu') }}
	</div>
</header>