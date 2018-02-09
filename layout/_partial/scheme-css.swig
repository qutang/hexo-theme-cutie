{% if site.data.cutie %}
    {% set scheme = site.data.cutie['global']['scheme'] %}
{% else %}
    {% set scheme = confg.cutie['global']['scheme'] %}
{% endif %}

{% if scheme === 'Taurus' %}
    {{ css('css/taurus') }}
{% else %}
    {{ css('css/taurus') }}
{% endif %}