<!-- variables: scheme_name, item, card_index -->

{% if scheme_name === 'taurus' %}
    {{ partial('_partial/header', {position: 'header'}) }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/_header/layout') }}
{% endif %}