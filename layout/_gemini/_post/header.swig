<div class='post-header' style='background-image: url("{{ generate_trianglify_image(post_title) }}")'>
    <div class='post-title-container'>
        <div class='post-icon'>
            <a href="#" data-no-instant>
                <img src="{{ post_icon }}" alt="" onerror='this.src = "{{ generate_post_icon(post_title) }}"'>
            </a>
        </div>
        <h1 class='post-title'>
            <a href="{{ post_url }}">
                {{ post_title_display }}
            </a>
        </h1>
    </div>
    <div class='post-meta'>
        <div class='post-author'>
            <i class='fa fa-pencil fa-lg'></i>
            <p>{{ post_author }}</p>
        </div>
        <div class='post-date'>
            <a href='/archives/'>
                <i class='fa fa-calendar fa-lg'></i>
                <p>{{ post_date }}</p>
            </a>
        </div>
        <div class='post-copyright'>
            <a href='{{ post_copyright.license_url }}'>
                <i class='fa fa-copyright fa-lg'></i>
                <p>{{ post_copyright.license }}</p>
            </a>
        </div>
    </div>
</div>