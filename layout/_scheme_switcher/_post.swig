<!-- variables: scheme_name, item, card_index -->

{% if scheme_name === 'taurus' %}
    {{ partial('_partial/article', {item: item}) }}
{% elseif scheme_name === 'gemini' %}
    {{ partial('_gemini/_post/layout', {item: item}) }}
{% endif %}