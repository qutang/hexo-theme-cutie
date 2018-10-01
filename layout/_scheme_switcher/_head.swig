<!-- variables: scheme_name, scheme_color -->

{% if scheme_name === 'taurus' %}
    {{ partial('_taurus/head', {color: scheme_color}) }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/head', {color: scheme_color}) }}
{% endif %}