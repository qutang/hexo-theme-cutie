<div class='search-container'>
	{{ search_form({
		class: 'search',
		button: true
	}) }}
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
