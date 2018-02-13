
{% set scheme = site.data.cutie.global.scheme | default(theme.global.scheme) %}

{% if scheme === 'Taurus' %}
    {{ css('css/taurus') }}
{% else %}
    {{ css('css/taurus') }}
{% endif %}