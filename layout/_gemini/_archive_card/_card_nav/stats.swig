<div class="insight-info">
    <ul>
        {% if is_link_post %}
        <li>{{ __('external_link') }}</li>
        {% endif %}
        {% if use_post_stats %}
        <li>
            <a href="{{ comment_url }}">
                <i class='fa fa-comments fa-lg'></i>
                <span class='card-comment-count'>0</span>
            </a>
        </li>
        <li>
            <i class="fa fa-users fa-lg"></i>
            <span class='card-visit-count'>0</span>
        </li>
        <li class='card-thumbup-container'>
            <i class="fa fa-heart-o fa-lg"></i>
            <span class='card-thumbup-count'>0</span>
        </li>
        {% endif %}
    </ul>
</div>