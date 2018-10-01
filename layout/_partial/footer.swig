
{% set social = parse_config([site.data.cutie.social, theme.social]) %}
<footer id='footer'>
    <div class='footer-copyright'>
        <div>
            <p> {{ __('footer.copyright') }} <a href="{{ site.data.cutie.maintainer.url | default('') }}">{{ config.author }} </a> @ {{ date(Date.now(), 'YYYY') }}</p>
            <p>{{ __('footer.design') }}: <i class="fa fa-graduation-cap fa-lg"></i> <a href="https://qutang.github.io">Qu Tang</a> {{ __('footer.and') }} <i class="fa fa-paint-brush fa-lg"></i> <a href="https://moober.cn">Moober</a> &bull;
                {{ __('footer.develop') }}:  <i class="fa fa-graduation-cap fa-lg"></i> <a href="https://qutang.github.io">Qu Tang</a> &bull; 
                {{ __('footer.theme') }}: <a href="{{ theme.url }}">Cutie {{ theme.version }}-{{ parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) }}</a> &bull; 
                {{ __('footer.powered', '<a href="http://hexo.io">Hexo.</a>') }}</p>
        </div>
    </div>
    
    <div class='footer-social'>
        {% if social %}
            {% for item_name, item_link in social %}
                {% if item_link %}
                    <div class='footer-social-item'><a href='{{ item_link }}' target='_blank' ><i class="fa fa-{{ item_name }} fa-4x" aria-hidden="true"></i></a></div>
                {% endif %}
            {% endfor %}
        {% endif %}
    </div>
</footer>