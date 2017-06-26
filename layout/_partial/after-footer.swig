{{ js('js/instantclick.min.js') }}
{{ js('js/social-share.min.js') }}
{{ js('js/theme.js')}}
<script>

/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://qutang-github-io.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
    </script>
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

    //
    var d = document, s = d.createElement('script');
    s.src = 'https://qutang-github-io.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    }
  }
  
});
InstantClick.init();
</script>