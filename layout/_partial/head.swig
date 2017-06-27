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
  
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FONT
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">

  <!-- CSS
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

  {{ css(['css/normalize.css', 'css/font-awesome.min.css', 'css/gridlex.min.css', 'css/skeleton.css', 'css/theme.css', 'css/share.min.css', 'css/lightbox.min.css']) }}

  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>
  <script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

  {{ partial('_partial/google_analytics') }}

  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="/images/favicon.png">

</head>