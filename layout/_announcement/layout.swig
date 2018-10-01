{% if is_home() %}
  {% set announcement = parse_config([site.data.cutie.global.announcement, theme.global.announcement]) %}
{% elif is_post() %}
  {% set announcement = page.announcement %}
{% endif %}

{% if announcement %}
  {{ partial('_announcement/script', {announcement: announcement}) }}
{% endif %}