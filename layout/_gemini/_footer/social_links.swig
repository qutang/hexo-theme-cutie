<div class='footer-social-links'>
    {% if social %}
        {% for item_name, item_link in social %}
            {% if item_link %}
                <div class='footer-social-item'><a href='{{ item_link }}' target='_blank' ><i class="fa fa-{{ item_name }} fa-2x" aria-hidden="true"></i></a></div>
            {% endif %}
        {% endfor %}
    {% endif %}
</div>