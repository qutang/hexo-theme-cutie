<div class='search-container'>
	{{ search_form({
		class: 'search',
		button: true
	}) }}

	<ul class="cat-list">
		{% for cat in site.categories %}
			<li><a href="{{'/categories/' + cat.name + '/'}}"><img src="{{ '/images/' + cat.name + '.svg' }}" alt="{{ cat.name }}" onerror='if(this.src != "/images/uncategorized.svg") this.src="/images/uncategorized.svg"' title='{{ cat.name }}'></a></li>
		{% endfor %}
	</ul>

	<div class='tag-cloud'>
		{{ tagcloud({
			min_font: 0.8,
			max_font: 2,
			unit: "em",
			amount: 100,
			color: true,
			end_color: "#D63E0A",
			start_color: "#488BAF"
		}) }}
	</div>
	
</div>
