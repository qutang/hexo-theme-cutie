<div class="container">
	{% block primary %}
		<h2><a href="{{ url_for(path) }}">{{ prefix }}{{ title }}</a></h2>
		<div class="grid-4_sm-1 grid-equalHeight">
		{% for post in items.sort("date", "desc") %}
			{{ partial('_partial/card-archive', {index:true, item: post}) }}
		{% endfor %}
		</div>
	{% endblock %}
</div>