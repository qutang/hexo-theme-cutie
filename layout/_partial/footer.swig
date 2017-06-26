<footer class='footer'>
    <div class='footer-logo'>
        <span>{{ config.cutie.signature }}</span>
    </div>
    <div class='footer-social'>
        {% set social = config.cutie.social %}
        {% if social %}
            {% for item_name, item_link in social %}
                {% if item_link %}
                    <div class='footer-social-item'><a href='{{ item_link }}' target='_blank' title='Find me on {{ item_name }}' ><i class="fa fa-{{ item_name }} fa-2x" aria-hidden="true"></i></a></div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
    <p> Copyright by <a href="">@{{ config.author }}</a> in {{ date(Date.now(), 'YYYY') }}</p>
    <p> Icons by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">Flaticon</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0</a></p>
    <p> Powered by <a href="hexo.io">Hexo.</a></p>
</footer>