{{ partial('_third_party/disqus') }}
{% if config.cutie.instantclick %}
  {{ partial('_third_party/instantclick') }}
{% endif %}
{{ partial('_third_party/lightgallery') }}

<script data-no-instant type='text/javascript'>
changeLayoutOnTouchScreen();
setVersionForCurrentPage();
setVersionBadgeForIndexPages();
</script>