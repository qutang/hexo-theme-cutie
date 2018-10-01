<div class='footer-site-info'>
    <div>
        <p> {{ __('footer.copyright') }} <a href="{{ author_url }}">{{ author_name }}</a> @ {{ date(Date.now(), 'YYYY') }}</p>
        <p>{{ __('footer.design') }}: <i class="fa fa-graduation-cap fa-lg"></i> <a href="https://qutang.github.io">{{ theme.author }}</a>
            {{ __('footer.and') }} <i class="fa fa-paint-brush fa-lg"></i> <a href="https://moober.cn">Moober</a> &bull;
            {{ __('footer.develop') }}: <i class="fa fa-graduation-cap fa-lg"></i> <a href="https://qutang.github.io">{{ theme.author }}</a> &bull; 
            {{ __('footer.theme') }}: <a href="{{ theme_url }}">Cutie {{ theme_version }}-{{ scheme_name }}</a> &bull; 
            {{ __('footer.powered', '<a href="http://hexo.io">Hexo.</a>') }}</p>
    </div>
</div>