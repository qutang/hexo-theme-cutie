{{ js('js/instantclick.min.js') }}
<script data-no-instant>
InstantClick.on('change', function(isInitialLoad) {
  if (isInitialLoad === false) {
    if (typeof MathJax !== 'undefined') // support MathJax
      MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    if (typeof prettyPrint !== 'undefined') // support google code prettify
      prettyPrint();
    if (typeof _hmt !== 'undefined')  // support 百度统计
      _hmt.push(['_trackPageview', location.pathname + location.search]);
    if (typeof ga !== 'undefined')  // support google analytics
        ga('send', 'pageview', location.pathname + location.search);
    changeLayoutOnTouchScreen();
    lightGallery(document.getElementById('lightgallery'));
    setVersionForCurrentPage();
    setVersionBadgeForIndexPages();
    //
    var d = document, s = d.createElement('script');
    s.src = 'https://qutang-github-io.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    }
});
InstantClick.init();
</script>
