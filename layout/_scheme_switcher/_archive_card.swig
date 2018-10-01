<!-- variables: scheme_name, item, card_index -->

{% if scheme_name === 'taurus' %}
    {{ partial('_gemini/_archive_card/layout', {items: item}) }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/_archive_card/layout', {item: item}) }}
{% endif %}