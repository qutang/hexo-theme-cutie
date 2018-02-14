{% if page.year %}
	
	{{ partial("_partial/archive", {path: "#", prefix: "", title: page.year, items: page.posts}) }}
	
{% else %}
	{% set years = get_years(page.posts) %}
	<div class='archive-container'>
		{% for year in years %}
			<h1>{{ year }}</h1>
			{% set year_posts = get_posts_by_year(page.posts, year) %}
			{% set num_year_posts = get_posts_by_year_count(page.posts, year) %}
			{% if num_year_posts > 16 %}
				{% set months = get_months(year_posts) %}
				{% for month in months %}
					{% set month_name = get_month_name(month) %}
					{% set year_month_posts = get_posts_by_year_and_month(year_posts, year, month) %}
					{{ partial("_partial/archive", {path: "archives/" + year + "/" + month + "/", title: __('date.' + month_name), items: year_month_posts}) }}
				{% endfor %}
			{% else %}
				{{ partial("_partial/archive", {path: "archives/" + year + "/", title: "", items: year_posts}) }}
			{% endif %}
		{% endfor %}
	</div>
	
{% endif %}