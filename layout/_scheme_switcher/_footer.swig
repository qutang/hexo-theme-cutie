{% if scheme_name === 'taurus' %}
    {{ partial('_partial/footer') }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/_footer/layout') }}
{% endif %}