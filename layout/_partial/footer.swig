{% if site.data.cutie %}
    {% set social = site.data['cutie']['social'] | default(config.cutie.social) %}
{% else %}
    {% set social = config.cutie.signature %}
{% endif %}
<footer class='footer'>
    <div class='footer-social'>
        {% if social %}
            {% for item_name, item_link in social %}
                {% if item_link %}
                    <div class='footer-social-item'><a href='{{ item_link }}' target='_blank' ><i class="fa fa-{{ item_name }} fa-2x" aria-hidden="true"></i></a></div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
    <p> {{ __('footer.copyright') }} <a href="{{ config.author_link }}">@{{ config.author }}</a> {{ date(Date.now(), 'YYYY') }}</p>
    <p> Icons by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">Flaticon</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0</a></p>
    <p>{{ __('footer.theme') }} <a href="http://qutang.github.io/2017/06/27/Hexo-theme-cutie/">Cutie</a> | {{ __('footer.powered', '<a href="http://hexo.io">Hexo.</a>') }}</p>
</footer>