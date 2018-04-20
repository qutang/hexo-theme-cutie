
{% set scheme = parse_config([site.data.cutie.global.scheme, theme.global.scheme]) %}

{% set use_animation = parse_config([site.data.cutie.global.use_animation, theme.global.use_animation]) %}

{% if scheme.name === 'Taurus' %}
    {{ css('css/taurus') }}
    {% if use_animation %}
        {{css('css/scheme-taurus/animations.css')}}
    {% endif %}
{% elif scheme.name === 'Chroma' %}
    {% set color = scheme.color %}
    {{ css('css/scheme-chroma-selector/chroma-' + color) }}
    {% if use_animation %}
        {{css('css/scheme-chroma/animations.css')}}
    {% endif %}
{% else %}
    {{ css('css/taurus') }}
    {% if use_animation %}
        {{css('css/scheme-taurus/animations.css')}}
    {% endif %}
{% endif %}