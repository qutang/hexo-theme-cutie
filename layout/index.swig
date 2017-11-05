<div class="container" id='{{ url_for(page.path) }}' data-name='index' data-version='{{ theme.version }}'>

	<div class='index-intro'>
		{{ config.cutie.slogan }}
	</div>

	{% block primary %}
		<div class="grid-2_md-1 grid-equalHeight">
		{% for post in page.posts %}
			{{ partial('_partial/card', {index:true, item: post}) }}
		{% endfor %}
		</div>
	{% endblock %}
	<br>
	{{ partial('_partial/pagination') }}
</div>