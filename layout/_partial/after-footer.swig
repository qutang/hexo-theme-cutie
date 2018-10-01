
{% set use_lightgallery = parse_config([site.data.cutie.post.use_lightgallery, theme.post.use_lightgallery]) %}

{% if use_lightgallery %}
    {{ partial('_third_party/lightgallery') }}
{% endif %}

{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = 1 %}
{% else %}
{% set use_post_stats = 0 %}
{% endif %}

{{ partial('post-version-js') }}

{% if use_post_stats %}
    {{ partial('post-visit-comment-count-js') }}
{% endif %}

{{ js('js/headroom.min.js') }}

<script data-no-instant type='text/javascript'>

initHeadroom();

// changeLayoutOnTouchScreen();

initCard();
</script>

