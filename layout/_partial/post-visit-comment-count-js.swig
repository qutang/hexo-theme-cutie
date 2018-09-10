
<script type='text/javascript'>
  {% if is_home() || is_archive() || is_tag() || is_category() %}
    function getIP(json) {
      loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/leancloud.js'], 'post-visit-comment-count');
    loadjs.ready('post-visit-comment-count', {
      success: function(){
          LeanCloud.init('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
          var leanCloud = LeanCloud.getInstance();
        {% for post in page.posts %}
          {% set url = url_for(post.path) %}
          {% set id = hashit(url_for(post.path)) %}
          // start caching post visit and comment counts
          leanCloud.fetchIsThumbUp('{{ url }}', json.ip);
          leanCloud.fetchCommentCount('{{ url }}');
          leanCloud.fetchVisitCount('{{ url }}');
          leanCloud.fetchThumbUpCount('{{ url }}');
          leanCloud.getCommentCount('{{ url }}', function(count){
              var el = document.querySelector('#{{ id }} .card-comment-count');
              if(el) el.innerHTML = count;
          });
          leanCloud.getVisitCount('{{ url }}', function(count){
              var el = document.querySelector('#{{ id }} .card-visit-count');
              if(el) el.innerHTML = count;
          });
          leanCloud.getThumbUpCount('{{ url }}', function(count){
              var el = document.querySelector('#{{ id }} .card-thumbup-count');
              if(el) el.innerHTML = count;
          });
          leanCloud.isThumbUp('{{ url }}', function(isThumbUp){
              var el = document.querySelector('#{{ id }} .card-thumbup-container i');
              if(el){
                if(isThumbUp){
                  el.className = 'fas fa-thumbs-up';
                }else{
                  el.className = 'far fa-thumbs-up';
                }
              }
          });
        {% endfor %}
      }
    })
    }
  {% elif is_post() %}
  // update cookie if this page is opened (directly)
  function getIP(json) {
  loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/leancloud.js'], 'post-visit-comment-count');
  loadjs.ready('post-visit-comment-count', function(){
    {% set url = url_for(page.path) %}
    {% set id = hashit(url_for(post.path)) %}
    LeanCloud.init('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
    var leanCloud = LeanCloud.getInstance();
    leanCloud.fetchIsThumbUp('{{ url }}', json.ip);
    document.getElementById('thumb-up-button').addEventListener('click', function(e){
      leanCloud.isThumbUp('{{ url }}', function(isThumbUp){
        console.log('is thumb up:' + isThumbUp);
        if(isThumbUp){
          leanCloud.removeThumbUpRecord('{{ url }}', json.ip);
          document.getElementById('thumb-up-icon').className = "far fa-thumbs-up fa-lg";
          
        }else{
          leanCloud.addThumbUpRecord('{{ url }}', json.ip);
          document.getElementById('thumb-up-icon').className = "fas fa-thumbs-up fa-lg";
        }
        leanCloud.getThumbUpCount('{{ url }}', function(count){
            console.log('thumb up count: ' + count)
            var el = document.getElementById('article-thumbup-count');
            if(el) el.innerHTML = count;
        });
      });
    });
    leanCloud.addVisitRecord('{{ url }}', json.ip);
    leanCloud.fetchCommentCount('{{ url }}');
    leanCloud.fetchVisitCount('{{ url }}');
    leanCloud.fetchThumbUpCount('{{ url }}');
    leanCloud.getCommentCount('{{ url }}', function(count){
        var el = document.querySelector('#article-comment-count');
        if(el) el.innerHTML = count;
    });
    leanCloud.getVisitCount('{{ url }}', function(count){
        var el = document.querySelector('#article-visit-count');
        if(el) el.innerHTML = count;
    });
    leanCloud.getThumbUpCount('{{ url }}', function(count){
        var el = document.getElementById('article-thumbup-count');
        if(el) el.innerHTML = count;
    });
    leanCloud.isThumbUp('{{ url }}', function(isThumbUp){
        console.log('init thumb up:' + isThumbUp);
        if(isThumbUp){
          document.getElementById('thumb-up-icon').className = "fas fa-thumbs-up fa-lg";
        }else{
          document.getElementById('thumb-up-icon').className = "far fa-thumbs-up fa-lg";
        }
    });
  });
  }
  {% endif %}
</script>

<script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
