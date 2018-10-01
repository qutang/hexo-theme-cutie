<div class="header-nav-item" id='{{ drop_down_item_id }}'>
    <div class="drop-down-item-name">
            <a class='drop-down-item-link' href='#' onclick='onClickMenuIcon(event);' ontouchstart='onClickMenuIcon(event);'>
                <img src="{{ drop_down_item_image }}" alt="">
            <!-- <i class="fa fa-navicon fa-2x"></i> -->
            </a>
    </div>
    <div class="drop-down-item-dropdown">
		{% for menu_name, menu_content in menu %}
			{% set use_item = true %}
			{% for cat in site.categories %}
				{% if url_for(menu_content.link) == url_for('/categories/' + cat.name + '/') %}
					{% set use_item = false %}
				{% endif %}
			{% endfor %}
		    {% if use_item == true %}
            {{ partial('_gemini/_header/_header_nav/text_item', {text_item_active: url.indexOf(menu_content.link) !== -1,
                                                                text_item_name: menu_name,
                                                                text_item_link: menu_content.link}) }}
		    {% endif %}
		{% endfor %}
		{% for cat in site.categories %}
        {% set cat_link = '/categories/' + cat.name + '/' %}
        {{ partial('_gemini/_header/_header_nav/text_item', {text_item_active: url.indexOf(cat_link) !== -1,
                                                             text_item_name: cat.name,
                                                             text_item_link: cat_link}) }}
		{% endfor %}
	</div>
</div>