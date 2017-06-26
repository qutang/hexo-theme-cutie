<nav class="menu">
	{% if config.cutie.menu %}
		{% set menu = config.cutie.menu %}
	{% else %}
		{% set menu = theme.menu %}
	{% endif %}
	<div class='menu-item'>
		<div class='menu-icon'>
			<a href="/archives/">
			<img src="{{ '/images/archive.svg' }}" alt="">
			</a>
		</div>
		<div class="menu-name">
			<a class='menu-link' href="/archives/">
				<span>Archives</span>
			</a>
		</div>
	</div>
	{% set count = false %}
	{% for menu_name, menu_content in menu %}
		{% if loop.index == 5 %}
			{% set count = true %}
		{% endif %}
		{% if not count %}
			<div class='menu-item'>
			{% if menu_content.icon %}
				<div class='menu-icon'>
				<a href="{{ menu_content.link }}">
					<img src="{{ menu_content.icon }}" alt="">
					</a>
					</div>
					{% endif %}
					<div class="menu-name">
						<a class='menu-link' href="{{ menu_content.link }}">
							<span>{{ menu_name | capitalize }}</span>
						</a>
					</div>
				</a>
			</div>
		{% endif %}
	{% endfor %}
	<div class='menu-item'>
		<div class='menu-icon'>
			<a href="/search/">
			<img src="{{ '/images/search.svg' }}" alt="">
			</a>
		</div>
		<div class="menu-name">
			<a class='menu-link' href="/search/">
				<span>Search</span>
			</a>
		</div>
	</div>
</nav>
