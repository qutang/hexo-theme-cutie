<div class='card-icon'>
    {% if is_link_post %}
        <a href="{{ external_link }}" rel="noopener noreferrer" target="_blank">
    {% else %}
        <a href="{{ page_url }}">
    {% endif %} 
            {% if page_icon %}
                <img src="{{ page_icon }}" alt="" onerror='this.src = "{{ generate_post_icon(title) }}"'> 
            {% else %}
                <img src="{{ generate_post_icon(title) }}" alt="" > 
            {% endif %}
        </a>
</div>