{% set allow_share = parse_config([item.allow_share, site.data.cutie.post.allow_share, theme.post.allow_share]) %}
{% set allow_modification = parse_config([item.allow_modification, site.data.cutie.post.allow_modification, theme.post.allow_modification]) %}
{% set allow_commercial = parse([item.allow_commercial, site.data.cutie.post.allow_commercial, theme.post.allow_commercial])  %}

{% if allow_share == true %}
    {% set license = 'BY' %}
    {% if allow_commercial %}
    {% else %}
        {% set license = license + '-' + 'NC' %}
    {% endif %}

    {% if allow_modification %}
        {% set license = license + '-' + 'SA' %}
    {% else %}
        {% set license = license + '-' + 'ND' %}
    {% endif %}
{% else %}
    {% set license = __('post.no_share') %}
{% endif %}

{% if license !==  __('post.no_share') %}
    {% set license_url = 'https://creativecommons.org/licenses/' + license + '/4.0/' %}
    {% if config.language[0] == 'zh-cn' %}
        {% set license_url = license_url + 'deed.zh' %}
    {% endif %}
    {% set license = 'CC ' + license + ' 4.0' %}
{% else %}
    {% set license_url = 'mailto:' + site.data.cutie.maintainer.email %}
{% endif %}

{% set license_url = license_url | lower %}

{% set copyright = as_object(['share', 'modification', 'commercial', 'license', 'license_url'], [allow_share, allow_modification, allow_commercial, license, license_url]) %}

{{ copyright }}