{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}

{{ partial('_scheme_switcher/_post', {item: page, scheme_name: scheme_name}) }}