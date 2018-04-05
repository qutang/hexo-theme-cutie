{% set use_tencent_404 = site.data.cutie.page_404.tencent_404 | default(theme.page_404.tencent_404) %}
{% if use_tencent_404 %}
<script type="text/javascript" src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js" charset="utf-8" homePageUrl="/" homePageName="Back to home page"></script>
{% else %}
<style>
    body {
      background-color: white;
    }
</style>
<div class='article' style='margin-top: 15%'>
    <div class='article-content'>
            <blockquote>
                <img src="/images/404.gif" alt="">
                <footer>
                    <strong>Collect UI</strong>
                    <cite><a href="https://medium.com/@CollectUI/404-page-design-inspiration-march-2017-f6d9f7efd054">404 Page Design Inspiration</a></cite>
                </footer>
            </blockquote>
        </div>
</div>


{% endif %}