{% if site.data.cutie %}
    {% set social = site.data['cutie']['social'] | default(config.cutie.social) %}
{% else %}
    {% set social = config.cutie.signature %}
{% endif %}
<footer id='footer'>
    <div class='footer-copyright'>
        <div>
            <p> {{ __('footer.copyright') }} <a href="{{ config.author_link }}">{{ config.author }}</a> {{ date(Date.now(), 'YYYY') }}</p>
            <p>{{ __('footer.design') }}: 🌱<a href="https://moober.cn">Moober</a> {{ __('footer.and') }} 👓<a href="https://moober.cn">Qu Tang</a> ◽ {{ __('footer.theme') }}: <a href="{{ theme.url }}">Cutie {{ theme.version }}</a> ◽ {{ __('footer.powered', '<a href="http://hexo.io">Hexo.</a>') }}</p>
        </div>
    </div>
    
    <div class='footer-social'>
        {% if social %}
            {% for item_name, item_link in social %}
                {% if item_link %}
                    <div class='footer-social-item'><a href='{{ item_link }}' target='_blank' ><i class="fab fa-{{ item_name }} fa-2x" aria-hidden="true"></i></a></div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
</footer>