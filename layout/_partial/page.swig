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
	<hr />
    <!-- Content -->
    <div class='article-content'>
    {{ item.content | default("No content") }}
    </div>
    <hr />
    <div class="social-share"></div>
    {% if comment %}
        <h2>{{ __('post.comment') }}</h2>
        {{ partial('_partial/comment-html') }}
    {% endif %}
</section>