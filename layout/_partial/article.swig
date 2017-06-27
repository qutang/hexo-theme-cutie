<style>
    body {
        background-color: white;
    }
</style>

<article class="article">

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
                {{ titlecase(item.title) | default("No title") }}
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

    <!-- Gallery -->
    {% if item.photos && item.photos.length %}
        <div class='article-gallery'>
            {% for photo in item.photos %}
                <div class='article-gallery-item'>
                    <a href="{{ photo }}" data-lightbox="gallery" data-title="{{ titlecase(item.title) | default("No title") }}"><img src="{{ photo }}" alt="" /></a>
                </div>
            {% endfor %} 
        </div>
        <hr>
    {% endif %}
    

    <!-- Content -->
    {{ item.content | default("No content") }}
    <hr />

    <h2>Share and comment</h2>
    <div class="social-share"></div>
    {% if comment %}
        <div id="disqus_thread"></div>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    {% endif %}

    
    
</article>