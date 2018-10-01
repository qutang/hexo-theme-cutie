{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}

{% if page.year %}
	
	<div class="archive-cards">
	{% for post in page.posts.sort("date", "desc") %}
		{{ partial('_scheme_switcher/_archive_card', {item: post, scheme_name: scheme_name}) }}
	{% endfor %}
	</div>
	
{% else %}
	{% set years = get_years(page.posts) %}
	<div class='archive-container'>
		<div class="archive-cards">
		{% for year in years %}
			
				<h1 class='archive-title'><span>{{ year }}</span></h1>
			{% set year_posts = get_posts_by_year(page.posts, year) %}
			{% set num_year_posts = get_posts_by_year_count(page.posts, year) %}
			{% if num_year_posts > 9 %}
				{% set months = get_months(year_posts) %}
				{% for month in months %}
					{% set month_name = get_month_name(month + 1) %}
					{% set year_month_posts = get_posts_by_year_and_month(year_posts, year, month) %}
					<div class='archive-section'>
					{% for post in year_month_posts.sort("date", "desc") %}
						{{ partial('_scheme_switcher/_archive_card', {item: post, scheme_name: scheme_name}) }}
					{% endfor %}
					</div>
				{% endfor %}
			{% else %}
				<div class='archive-section'>
				{% for post in year_posts.sort("date", "desc") %}
					{{ partial('_scheme_switcher/_archive_card', {item: post, scheme_name: scheme_name}) }}
				{% endfor %}
				</div>
			{% endif %}
			
		{% endfor %}
		</div>
	</div>
	
{% endif %}