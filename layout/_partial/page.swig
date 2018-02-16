<style>
    body {
        background-color: white;
    }
</style>

<section class="page">
    <div class='page-meta'>
        <p><small>{{ item.meta_info }}</small></p>
    </div>
    <!-- Title -->
    <div class='article-header'>
         <h1 class='article-title'>
            <a href="{{ url_for(item.path) }}">
                {{ item.title }}
            </a>
        </h1>
    </div>
    <!-- Content -->
    <div class='article-content'>
    {{ item.content | default("No content") }}
    </div>
<<<<<<< HEAD
    <hr />
    <div class="social-share"></div>
=======
>>>>>>> v2.0-beta
    {% if comment %}
        {{ partial('_partial/comment-html') }}
    {% endif %}
</section>