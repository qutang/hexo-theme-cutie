<script type="text/javascript" src="https://l2.io/ip.js?var=user_ip"></script>
<script type='text/javascript'>
  {% if is_home() || is_archive() || is_tag() || is_category() %}
    loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/leancloud.js'], 'post-visit-comment-count');
    loadjs.ready('post-visit-comment-count', {
      success: function(){
          LeanCloud.init('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
          var leanCloud = LeanCloud.getInstance();
        {% for post in page.posts %}
          {% set url = url_for(post.path) %}
          {% set id = hashit(url_for(post.path)) %}
          // start caching post visit and comment counts
          leanCloud.fetchCommentCount('{{ url }}');
          leanCloud.fetchVisitCount('{{ url }}');
          leanCloud.getCommentCount('{{ url }}', function(count){
              var el = document.querySelector('#{{ id }} .card-comment-count');
              if(el) el.innerHTML = count;
          });
          leanCloud.getVisitCount('{{ url }}', function(count){
              var el = document.querySelector('#{{ id }} .card-visit-count');
              if(el) el.innerHTML = count;
          });
        {% endfor %}
      }
    })
  {% elif is_post() %}
  // update cookie if this page is opened (directly)
  loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/leancloud.js'], 'post-visit-comment-count');
  loadjs.ready('post-visit-comment-count', function(){
    {% set url = url_for(page.path) %}
    {% set id = hashit(url_for(post.path)) %}
    LeanCloud.init('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
    var leanCloud = LeanCloud.getInstance();
    leanCloud.addVisitRecord('{{ url }}', user_ip);
    leanCloud.fetchCommentCount('{{ url }}');
    leanCloud.fetchVisitCount('{{ url }}');
    leanCloud.getCommentCount('{{ url }}', function(count){
        var el = document.querySelector('#article-comment-count');
        if(el) el.innerHTML = count;
    });
    leanCloud.getVisitCount('{{ url }}', function(count){
        var el = document.querySelector('#article-visit-count');
        if(el) el.innerHTML = count;
    });
  });
  {% endif %}
</script>