<!-- variables: scheme_name, item, card_index -->

{% if scheme_name === 'taurus' %}
    {{ partial('_partial/card-v2', {item: item, index: card_index}) }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/_home_card/layout', {item: item, card_index: card_index}) }}
{% endif %}