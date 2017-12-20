{% if site.data.cutie %}
    {% set comment_system = site.data.cutie['global']['comment_system'] %}
{% else %}
    {% set comment_system = config.cutie['global']['comment_system'] %}
{% endif %}

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
{{ partial('_third_party/lightgallery') }}

<script data-no-instant type='text/javascript'>
changeLayoutOnTouchScreen();
setVersionForCurrentPage();
setVersionBadgeForIndexPages();
</script>