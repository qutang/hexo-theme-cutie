<script type='text/javascript'>

  {% if is_home() || is_archive() || is_tag() || is_category() %}
    loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/post.v2.js'], 'post-version');
    loadjs.ready('post-version', {
      success: function(){
        console.log('ready to run badge script')
        {% for post in page.posts %}
          {% set id = hashit(url_for(post.path)) %}
          {% set enable_unread_badge = parse_config([post.enable_unread_badge, site.data.cutie.post.enable_unread_badge, theme.post.enable_unread_badge]) %}
          {% if enable_unread_badge %}
          // show/hide post unread badage
          var postLinks = document.querySelectorAll('#{{ id }} .Card-title a, #{{ id }} .Card-excerpt a, #{{ id }} .Card-figure a');
          new Postv2('{{ id }}').showUnreadNotification('{{ hashit(trim(strip_html_and_whitespaces(post.content))) }}', function(){
            console.log('show badge for {{ post.path }} : {{ id }}');
            var postBadge = document.querySelector('#{{ id }} mark.Card-badge');
            $(postBadge).fadeIn();
          }, function(){
            console.log('hide badge for {{ post.path }} : {{ id }}');
            var postBadge = document.querySelector('#{{ id }} mark.Card-badge');
            $(postBadge).fadeOut();
          }); 
          // update cookie upon click the post and hide badge immediately
          for(var i = 0;i < postLinks.length; i++){
            postLinks[i].onclick = function(){
              new Postv2('{{ id }}').update('{{ hashit(trim(strip_html_and_whitespaces(post.content))) }}', function(){
                console.log('called');
                var postBadge = document.querySelector('#{{ id }} mark.Card-badge');
                $(postBadge).fadeOut();
              });
            }
          }
          {% else %}
            var postBadge = document.querySelector('#{{ id }} mark.Card-badge');
            $(postBadge).fadeOut();
            
          {% endif %}
        {% endfor %}
      }
    })
  {% elif is_post() %}
  // update cookie if this page is opened (directly)
  loadjs(['{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/post.v2.js'], 'post-version');
  loadjs.ready('post-version', function(){
    {% set id = hashit(url_for(page.path)) %}
    new Postv2('{{ id }}').update('{{ hashit(trim(strip_html_and_whitespaces(page.content))) }}', function(){});
  });
  {% endif %}
</script>