<div class="container">
	{% block primary %}
		{% if type == 'category' %}
		 <div class='article-header'>
			<div class='article-logo'>
                <img src="{{ '/images/' + title + '.svg' }}" alt="">
         	</div><h2 class='article-title'>{{ title }}</h2>
		</div>
		{% else %}
			<h2>{{ prefix }}{{ title }}</h2>
		{% endif %}
		<div class="grid-4_sm-1 grid-equalHeight">
		{% for post in items.sort("date", "desc") %}
			{{ partial('_partial/card-archive', {index:true, item: post}) }}
		{% endfor %}
		</div>
	{% endblock %}
</div>