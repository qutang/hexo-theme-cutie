<div class="container">

	<div class='index-intro'>
		{% set intro = get_intro(site) %}
		{% for model in intro %}
			{% if loop.first %}
				{{ model.content }}
			{% endif %}
		{% endfor %}
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