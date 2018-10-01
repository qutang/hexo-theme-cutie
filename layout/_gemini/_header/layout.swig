
{% set site_logo = parse_config([site.data.cutie.global.logo, theme.global.logo, site.data.cutie.logo, theme.logo]) %}
{% set site_title = parse_config([site.data.cutie.global.title, theme.global.title, config.title]) %}
{% set site_subtitle = truncate(parse_config([site.data.cutie.global.subtitle, theme.global.subtitle, config.subtitle]), {length: 40, separator: ' ', omission: '...'}) %}
{% set site_menu = parse_config([site.data.cutie.menu, theme.menu]) %}
{% set icon_set = parse_config([site.data.cutie.global.scheme.icon_set, theme.global.scheme.icon_set, site.data.cutie.global.icon_set, theme.global.icon_set]) %}
{% set icon_items = {insight: {link: url_for('/'), image: url_for('/images/icons/' + icon_set + '/insight.svg')},
					 archives: {link: url_for('/archives/'), image: url_for('/images/icons/' + icon_set + '/archive.svg')},
					 search: {link: url_for('/search/'), image: url_for('/images/icons/' + icon_set + '/search.svg')}
					 } %}


<header id="header" class='header'>
	{{ partial('_gemini/_header/header_title', {site_title: site_title, site_subtitle: site_subtitle, site_logo: site_logo}) }}
	{{ partial('_gemini/_header/_header_nav/layout', {
			menu: site_menu,
			icon_set: icon_set,
			icon_items: icon_items
	}) }}
</header>