
{% block primary %}
	{% if type == 'category' %}
    <div class='archive-header'>
		<div class='archive-logo'>
            <img src="{{ '/images/' + title + '.svg' }}" alt="">
        </div>
        <h2 class='archive-title'>{{ title | capitalize }}</h2>
	</div>
	{% else %}
		<h2 class='archive-title'>{{ prefix }}{{ title }}</h2>
	{% endif %}
	<div class="archive-cards">
	{% for post in items.sort("date", "desc") %}
		{{ partial('_gemini/_archive_card/layout', {item: post}) }}
	{% endfor %}
	</div>
{% endblock %}
