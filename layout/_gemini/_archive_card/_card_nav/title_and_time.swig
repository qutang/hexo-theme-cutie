<div class='title-time-info'>
    <h4>
        {% if is_link_post %}
            <a href="{{ external_link }}" rel="noopener noreferrer" target="_blank">
        {% else %}
            <a href="{{ page_url }}">
        {% endif %}
            {{ title_display }}
            </a>
    </h4>
    <p>
        <a href="{{ archive_url }}">
            <i class='fa fa-calendar fa-lg'></i> {{ partial('_variables/_page_and_post/date', {item: item}) }}
        </a>
    </p>
</div>