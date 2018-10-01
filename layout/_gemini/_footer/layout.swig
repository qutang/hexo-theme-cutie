
{% set social = parse_config([site.data.cutie.social, theme.social]) %}
{% set author_url = parse_config([site.data.cutie.global.author.url, site.data.cutie.maintainer.url, '']) %}
{% set author_name = parse_config([site.data.cutie.global.author.name, site.data.cutie.maintainer.name, config.author]) %}
{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}

<footer class='footer' id='footer'>
    {{ partial('_gemini/_footer/site_info', {
        author_name: author_name,
        author_url: author_url,
        theme_url: theme.url,
        theme_author: theme.author,
        theme_version: theme.version,
        scheme_name: scheme_name
    }) }}
    {{ partial('_gemini/_footer/social_links', {
        social: social
    }) }}
</footer>