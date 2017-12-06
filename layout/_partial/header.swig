<header class="header">
	<div class="header-title">
		{% if config.cutie.logo %}
			<div class='header-logo'><a href='/'>
				<img class='grow' src='{{ config.cutie.logo }}' />
			</a></div>
			<div class='header-text' >
			    <h1>{{ config.title }}</h1>
				<p><small>{{ truncate(config.description, {length: 40, separator: ' ', omission: '...'}) }}</small></p>
			</div>
		{% else %}
			<div class='header-text-no-image'>
				<h1><a href="/">{{ config.title }}</a></h1>
				<p><small>{{ truncate(config.description, {length: 40, separator: ' ', omission: '...'}) }}</small></p>
			</div>
			
		{% endif %}
	</div>
	<div id="header-menu-container">
		{{ partial('_partial/menu') }}
	</div>
</header>