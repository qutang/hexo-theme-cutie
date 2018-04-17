
{% set slogan = site.data.cutie.slogan | default(theme.slogan) %}

<div class="index-container" id='{{ url_for(page.path) }}' data-name='index' data-version='{{ theme.version }}'>
	<div class='index-intro'>
		{{ slogan }}
	</div>
	{% block primary %}
		<div class="grid-2_md-1 grid-equalHeight index-cards">
		{% for post in page.posts %}
			{{ partial('_partial/card', {index:true, item: post, index:loop.index}) }}
		{% endfor %}
		</div>
	{% endblock %}
	<br>
	
	{{ partial('_partial/pagination') }}
</div>