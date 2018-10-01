{% set excerpt = parse_config([item.abstract, item.excerpt, item.content, "No content"]) %} 
{% set excerpt = trim(truncate(strip_html(excerpt), {length: 500, separator: ' ', omission: '...'})) %}

{{ excerpt }}