
{% set comment_system = parse_config([site.data.cutie.global.comment_system, theme.global.comment_system]) %}
{% set title = parse_config([site.data.cutie.global.title, config.title]) %}
{% set description = parse_config([site.data.cutie.global.description, config.description]) %}
{% set author = parse_config([site.data.cutie.global.author, config.author]) %}
{% set favicon = site.data.cutie.global.favicon %}
{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}
{% set scheme_color = parse_config([site.data.cutie.global.scheme.color, theme.global.scheme.color]) %}

<head>
  <link rel="icon" type="image/png" href="{{ favicon }}">
  {{ partial('_head/meta', {author: author, description: description}) }}
  {{ partial('_head/title', {title: title}) }}
  {{ partial('_head/js') }}
  
  {{ partial('_scheme_switcher/_head', {scheme_name: scheme_name, scheme_color: scheme_color}) }}
  {{ partial('_head/css') }}
  <!-- load font awesome 5 -->
  <!-- <link rel="stylesheet" href="{{ theme.libs.fontawesome.css }}" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome-font-awesome.min.css">
  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({
  tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
  </script>

  {{ js('js/theme.js')}}
</head>