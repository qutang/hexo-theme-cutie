<footer class='footer grid grid-center grid-middle grid-column'>
    <div class='footer-logo'>
        <span>{{ config.signature }}</span>
    </div>
    <div class='col grid footer-social'>
        <div><a href='{{ config.social.weixin }}'><i class="fa fa-weixin fa-2x" aria-hidden="true"></i></a></div>
        <div><a href='{{ config.social.github }}'><i class="fa fa-github fa-2x" aria-hidden="true"></i></a></div>
        <div><a href='{{ config.social.linkedin }}'><i class="fa fa-linkedin fa-2x" aria-hidden="true"></i></a></div>
    </div>
    <p> Copyright by <a href="">@{{ config.author }}</a> in {{ date(Date.now(), 'YYYY') }}</p>
    <p> Icons by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">Flaticon</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0</a></p>
    <p> Powered by <a href="hexo.io">Hexo.</a></p>
</footer>