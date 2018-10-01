
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

  <!-- load minified javascript -->
  {{ js(theme.minified_libs.js) }}

  <!-- load minified css -->
  {{ css(theme.minified_libs.css) }}
  
{{ partial('_partial/scheme-color') }}
{{ partial('_partial/scheme-css') }}


 <script src="https://cdnjs.cloudflare.com/ajax/libs/trianglify/1.1.0/trianglify.min.js"></script>

  <!-- load font awesome 5 -->
  <!-- <link rel="stylesheet" href="{{ theme.libs.fontawesome.css }}" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css">
  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>

    {{ js('js/theme.js')}}
  
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