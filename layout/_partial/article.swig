<style>
    body {
        background-color: white;
    }
</style>

<section class="article">
    <!-- Title -->

    {% if item.categories && item.categories.length %}
        {% for cat in item.categories %}
            {% if loop.first %}
                {% set category_name = cat.name %}
                {% set category_link = url_for(cat.path) %}
            {% endif %}
        {% endfor %}
    {% else %}
        {% set category_link = url_for(item.path) %}
        {% set category_name = 'uncategorized' %}
    {% endif %}

    <div class='article-header'>
         <div class='article-logo'>
            <a href="{{ category_link }}">
                <img src="{{ '/images/' + category_name + '.svg' }}" alt="">
            </a>
         </div>
         <h1 class='article-title'>
            <a href="{{ url_for(item.path) }}">
                {{ item.title }}
            </a>
        </h1>
    </div>
   
    <!-- Date and Author -->
    <p>
       	{{ item.date.format(config.date_format) }}
        by {{ item.author | default(config.author) }}
    </p>
    <p>
        {{ partial("_partial/article-tags", {item: item}) }}
    </p>
	<hr />
    <!-- Content -->
    {{ item.content | default("No content") }}
    <hr />

    <div class="social-share"></div>
</section>