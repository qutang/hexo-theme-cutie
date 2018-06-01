
{% set comment_system = parse_config([site.data.cutie.global.comment_system, theme.global.comment_system]) %}


<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  {% if is_home() %}
      <title>{{ config.title }}</title>
  {% elif is_year() %}
      <title>{{ page.year + " - Archive - " + config.title }}</title>
  {% elif is_archive() %}
      <title>{{ "Archive - " + config.title }}</title>
  {% elif is_category() %}
      <title>{{ page.category + " - Category - " + config.title }}</title>
  {% elif is_tag() %}
      <title>{{ page.tag + " - Tag - " + config.title }}</title>
  {% elif is_post() %}
      <title>{{ page.title | default('No title') + " - " + config.title }}</title>
  {% elif is_page() %}
      <title>{{ page.title | default('No title') + " - " + config.title }}</title>
  {% elif path.indexOf('search') !== -1 %}
      <title>{{ "Search" + " - " + config.title }}</title>
  {% elif path.indexOf('404') !== -1 %}
      <title>{{ "Not Found" + " - " + config.title }}</title>
  {% endif %}

  
  
  <meta name="description" content="{{ config.description }}">
  <meta name="author" content="{{ config.author }}">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- load loadjs.js -->
  {{ js(theme.libs.loadjs.js_min) }}


{{ css(theme.libs.animate.css_min) }}
  <!-- load lightgallery -->
{{ css('css/lightgallery.css') }}
{{ css(theme.libs.noty.css) }}
<script
src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>
  
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-2840557666807289",
    enable_page_level_ads: true
  });
</script>

<!-- load swiper.js -->
{{ js(theme.libs.swiper.js_min) }}
{{ css(theme.libs.swiper.css_min) }}

  <!-- load font awesome 5 -->
  <script defer src="{{ theme.libs.fontawesome.js_cdn }}"></script>

  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>
  <!-- load mathjax -->
  <!-- <script type="text/javascript" async src="{{ theme.libs.mathjax.js_cdn }}"></script> -->

  <!-- load js-cookie -->
  <script src="{{ theme.libs.jscookie.js_cdn }}"></script>
    {{ js('js/social-share.min.js') }}
    {{ js('js/theme.js')}}

  <!-- include cookie.js -->
  
  {{ partial('_partial/google_analytics') }}

  <!-- include comment system code -->
  {% if comment_system === 'valine' %}
    {{ partial('_third_party/valine_head') }}
  {% elseif comment_system === 'gitment' %}
    {{ partial('_third_party/gitment_head') }}
  {% endif %}

  {{ partial('_partial/scheme-css') }}
  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="/images/favicon.png">
</head>