
{% set scheme = parse_config([site.data.cutie.global.scheme.color, theme.global.scheme.color]) %}

{% if scheme.color === 'lime' %}
    {{ css('css/colors/lime') }}
{% else %}
    {{ css('css/colors/lime') }}
{% endif %}