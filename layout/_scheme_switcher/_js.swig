<!-- variables: scheme_name, scheme_color -->

{% if scheme_name === 'taurus' %}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/js') }}
{% endif %}