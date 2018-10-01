{% if is_home() %}
      <title>{{ title }}</title>
  {% elif is_year() %}
      <title>{{ page.year + " - Archive - " + title }}</title>
  {% elif is_archive() %}
      <title>{{ "Archive - " + config.title }}</title>
  {% elif is_category() %}
      <title>{{ page.category + " - Category - " + title }}</title>
  {% elif is_tag() %}
      <title>{{ page.tag + " - Tag - " + title }}</title>
  {% elif is_post() %}
      <title>{{ page.title | default('No title') + " - " + title }}</title>
  {% elif is_page() %}
      <title>{{ page.title | default('No title') + " - " + title }}</title>
  {% elif path.indexOf('search') !== -1 %}
      <title>{{ "Search" + " - " + title }}</title>
  {% elif path.indexOf('404') !== -1 %}
      <title>{{ "Not Found" + " - " + title }}</title>
  {% endif %}