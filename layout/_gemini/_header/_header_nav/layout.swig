<nav class="header-nav" id="header-nav">
	{% for menu_name, menu_content in menu %}
		{{ partial('_gemini/_header/_header_nav/text_item', {text_item_active: url.indexOf(menu_content.link) !== -1,
																text_item_name: menu_name,
																text_item_link: menu_content.link}) }}
	{% endfor %}
	{% for icon_name, icon_content in icon_items %}
		{{ partial('_gemini/_header/_header_nav/icon_item', {icon_item_active: url.indexOf(icon_content.link) !== -1,
															 icon_item_name: icon_name,
															 icon_item_link: icon_content.link,
															 icon_item_image: icon_content.image,
															 icon_item_id: 'icon-item-' + icon_name}) }}
	{% endfor %}
	
	{{ partial('_gemini/_header/_header_nav/drop_down_item', {drop_down_item_id: 'drop-down-item',
															  drop_down_item_image: url_for('/images/icons/' + icon_set + '/menu.svg'),
															  menu: menu}) }}
</nav>
