{% if text_item_id %}
<div class='header-nav-item' id='{{ text_item_id }}'>
{% else %} 
<div class='header-nav-item'>
{% endif %}
    {% if text_item_active %}
    <div class="text-item-name text-item-active">
    {% else %}
    <div class="text-item-name">
    {% endif %}
        <a class='text-item-link' href="{{ text_item_link }}">
            <span>{{ text_item_name | capitalize }} </span>
        </a>
    </div>
</div>
