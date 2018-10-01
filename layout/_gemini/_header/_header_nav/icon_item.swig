{% if icon_item_id %}
<div class='header-nav-item' id='{{ icon_item_id }}'>
{% else %}
<div class='header-nav-item'>
{% endif %}
    {% if icon_item_active %}
    <div class='icon-item-name icon-item-active'>
    {% else %}
    <div class='icon-item-name'>
    {% endif %}
        <a class='icon-item-link' href="{{ icon_item_link }}" title='{{ __("menu." + icon_item_name) }}'>
        <img src="{{ icon_item_image }}" alt="">
        <!-- <i class="fa fa-archive fa-2x"></i> -->
        </a>
    </div>
</div>