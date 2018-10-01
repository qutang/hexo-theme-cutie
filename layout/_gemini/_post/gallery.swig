{% if post_gallery && post_gallery.length %}
    <div class='post-gallery'>
        <div class='swiper-container'>
        <div class='swiper-wrapper'>
        {% for photo in post_gallery %}
            <div class='post-gallery-item swiper-slide'>
            <a class='post-gallery-item-link' href="{{ photo }}" data-no-instant>
                <img src="{{ photo }}" alt="" />
            </a>
            </div>
        {% endfor %} 
        </div>
    </div>
{% endif %}
