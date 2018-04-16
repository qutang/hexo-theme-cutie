<div class='search-container'>
	<input type="text" id='search-form'>

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
	<div class="archive-cards">
			<div class='Card-archive' style='display:none'>
				<div class="Card-body">
					<h3 class='Card-title'>
						<a>
						</a>
					</h3>
					<div class="Card-meta">
						<ul>
							<li><i class='fa fa-calendar'></i> <span class='Card-date'></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
</div>

{{ js(theme.libs.fuse.js_min) }}
<script>
	var options = {
		shouldSort: true,
		threshold: 0.4,
		tokenize: true,
		location: 0,
		distance: 100,
		maxPatternLength: 32,
		minMatchCharLength: 2,
		keys: [
			"title",
			"author",
			"tags"
		]
	};
	var s = '{{ get_posts_in_json(site.posts) }}';
	s = s.replace(/\\n/g, "\\n")  
               .replace(/\\'/g, "\\'")
               .replace(/\\"/g, '\\"')
               .replace(/\\&/g, "\\&")
               .replace(/\\r/g, "\\r")
               .replace(/\\t/g, "\\t")
               .replace(/\\b/g, "\\b")
               .replace(/\\f/g, "\\f")
// remove non-printable and other non-valid JSON chars
	s = s.replace(/[\u0000-\u0019]+/g,""); 
	var list = JSON.parse(s);
	var fuse = new Fuse(list, options);
	var el = document.getElementById('search-form');
	var newBox = $('.Card-archive').first().clone();
	el.oninput = function(event){
		var searchText = el.value;
		var result = fuse.search(searchText);
		$('.archive-cards .Card-archive').remove();
		for(var i in result){
			var anotherBox = newBox.clone();
			var dateStr = new Date(result[i].date);
			anotherBox.css('display','flex');
			var url = "";
			if(result[i].external_link !== ""){
				url = result[i].external_link;
			}else{
				url = '/' + result[i].path;
			}
			
			anotherBox.find('.Card-title a').text(result[i].title).attr('href', url);
			anotherBox.find('.Card-date').text(dateStr.toDateString());
			anotherBox.appendTo('.archive-cards');
		}
	}
</script>
