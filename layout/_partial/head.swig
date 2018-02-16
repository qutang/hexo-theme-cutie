<<<<<<< HEAD
{% if site.data.cutie %}
    {% set comment_system = site.data.cutie['global']['comment_system'] %}
{% else %}
    {% set comment_system = config.cutie['global']['comment_system'] %}
{% endif %}
=======

{% set comment_system = site.data.cutie.global.comment_system | default(theme.global.comment_system) %}
>>>>>>> v2.0-beta


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

  <!-- Load scheme css -->
  {{ css('css/lightgallery.css') }}
  {{ partial('_partial/scheme-css') }}

  <!-- load font awesome 5 -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>
  <script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

  <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
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