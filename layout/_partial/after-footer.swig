
{% set comment_system = site.data.cutie.global.comment_system | default(theme.global.comment_system) %}

{% if comment_system === 'valine' %}
    {{ partial('_third_party/valine') }}
{% elseif comment_system === 'disqus' %}
    {{ partial('_third_party/disqus') }}
{% elseif comment_system === 'gitment' %}
    {{ partial('_third_party/gitment') }}
{% endif %}

{% if config.cutie.instantclick %}
  {{ partial('_third_party/instantclick') }}
{% endif %}
{% set use_lightgallery = site.data.cutie.post.use_lightgallery | default(theme.post.use_lightgallery) %}
{% if use_lightgallery %}
{{ partial('_third_party/lightgallery') }}
{% endif %}
<script data-no-instant type='text/javascript'>
changeLayoutOnTouchScreen();
setVersionForCurrentPage();
setVersionBadgeForIndexPages();
fixCodeBlockForHighlightJs();
</script>