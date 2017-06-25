{% if page.year %}

	{{ partial("_partial/archive", {path: "#", prefix: "", title: page.year, items: page.posts}) }}
	
{% else %}
	{% set years = get_years(page.posts) %}
	{% for year in years %}
		{% set year_posts = get_posts_by_year(page.posts, year) %}
		{{ partial("_partial/archive", {path: "archives/" + year + "/", title: year, items: year_posts}) }}
	{% endfor %}
{% endif %}