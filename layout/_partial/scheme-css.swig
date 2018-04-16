
{% set scheme = site.data.cutie.global.scheme | default(theme.global.scheme) %}

{% set use_animation = site.data.cutie.global.use_animation | default(theme.global.use_animation) %}

{% if scheme === 'Taurus' %}
    {{ css('css/taurus') }}
    {% if use_animation %}
        {{css('css/scheme-taurus/animations.css')}}
    {% endif %}
{% elif scheme === 'Chroma' %}
    {{ css('css/chroma') }}
    {% if use_animation %}
        {{css('css/scheme-chroma/animations.css')}}
    {% endif %}
{% else %}
    {{ css('css/taurus') }}
    {% if use_animation %}
        {{css('css/scheme-taurus/animations.css')}}
    {% endif %}
{% endif %}