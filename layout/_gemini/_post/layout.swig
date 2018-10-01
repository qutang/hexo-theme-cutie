
{% set icon_set = partial('_variables/_site/icon_set') %}
{% set post_date = partial('_variables/_page_and_post/date', {item: item}) %}
{% set category_name = partial('_variables/_page_and_post/category_name', {item: item}) %}
{% set copyright = JSON.parse(partial('_variables/_page_and_post/copyright', {item: item})) %}
{% set excerpt = partial('_variables/_page_and_post/excerpt', {item: item}) %}
{% set use_stats = partial('_variables/_page_and_post/use_stats') %}
{% set id = url_for(item.path) %}
{% set post_name = item.title %}
{% set post_version = item.version %}
{% set post_title = item.title %}
{% set post_title_display = titlecase(item.title) | default("No title") %}
{% set post_url = url_for(item.path) %}
{% set post_icon = item.icon %}
{% set post_author = item.author.name | default(config.author) %}
{% set allow_comment = partial('_variables/_page_and_post/allow_comment') %}
{% set post_gallery = item.photos %}
{% set post_path = item.path %}

<article class="post" id="{{ id }}" data-name='{{ data_name }}' data-version="{{ post_version }}">
    {{ partial('_gemini/_post/header', {post_url: post_url, post_icon: post_icon, post_title_display: post_title_display, post_title: post_title, post_copyright: copyright}) }}
    {{ partial('_gemini/_post/gallery', {post_gallery: post_gallery}) }}
    <div class='post-content'>
        {{ item.content | default("No content") }}
    </div>

    {% if allow_comment %}
        <div class="post-comment" id='post-comment'>
            {{ partial('_comment/layout', {url: post_url, path: post.path}) }}
        </div>
    {% endif %}    
</article>