
{% set comment_system = site.data.cutie.global.comment_system | default(theme.global.comment_system) %}


<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  {% if is_home() %}
      <title>{{ config.title }}</title>
  {% endif %}
  {% if is_year() %}
      <title>{{ page.year + " - Archive - " + config.title }}</title>
  {% endif %}
  {% if is_archive() %}
      <title>{{ "Archive - " + config.title }}</title>
  {% endif %}
  {% if is_category() %}
      <title>{{ page.category + " - Category - " + config.title }}</title>
  {% endif %}
    {% if is_tag() %}
      <title>{{ page.tag + " - Tag - " + config.title }}</title>
  {% endif %}
  {% if is_post() %}
      <title>{{ page.title | default('No title') + " - " + config.title }}</title>
  {% endif %}
  
  <meta name="description" content="{{ config.description }}">
  <meta name="author" content="{{ config.author }}">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- load lightgallery -->
{{ css('css/lightgallery.css') }}
{{ css(theme.libs.noty.css) }}
<script
src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>
  
{{ partial('_partial/scheme-css') }}

 

  <!-- load font awesome 5 -->
  <script defer src="{{ theme.libs.fontawesome.js_cdn }}"></script>

  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>
  <!-- load mathjax -->
  <script type="text/javascript" async src="{{ theme.libs.mathjax.js_cdn }}"></script>

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
  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="/images/favicon.png">

</head>