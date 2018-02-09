
{% block primary %}
	{% if type == 'category' %}
		<div class='archive-header'>
		<div class='archive-logo'>
							<img src="{{ '/images/' + title + '.svg' }}" alt="">
				</div><h2 class='archive-title'>{{ title | capitalize }}</h2>
	</div>
	{% else %}
		<h2>{{ prefix }}{{ title }}</h2>
	{% endif %}
	<div class="archive-cards">
	{% for post in items.sort("date", "desc") %}
		{{ partial('_partial/card-archive', {index:true, item: post}) }}
	{% endfor %}
	</div>
{% endblock %}
