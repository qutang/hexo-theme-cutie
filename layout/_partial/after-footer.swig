
{% set comment_system = site.data.cutie.global.comment_system | default(theme.global.comment_system) %}

{% if comment_system === 'valine' %}
    {{ partial('_third_party/valine') }}
{% elseif comment_system === 'disqus' %}
    {{ partial('_third_party/disqus') }}
{% elseif comment_system === 'gitment' %}
    {{ partial('_third_party/gitment') }}
{% endif %}

{% if config.cutie.instantclick %}
  {{ partial('_third_party/instantclick') }}
{% endif %}
{% set use_lightgallery = site.data.cutie.post.use_lightgallery | default(theme.post.use_lightgallery) %}
{% if use_lightgallery %}
{{ partial('_third_party/lightgallery') }}
{% endif %}

{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = 1 %}
{% else %}
{% set use_post_stats = 0 %}
{% endif %}

{% if use_post_stats %}
<script type="text/javascript">
  var userip;
</script>
<script type="text/javascript" src="https://l2.io/ip.js?var=userip"></script>
{% endif %}

{{ js('js/post.js') }}

<script data-no-instant type='text/javascript'>
changeLayoutOnTouchScreen();

{% if is_post() %}
var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
        post.getCommentCount(window.location.pathname, function(count){
            $('#article-comment-count').text(count);
        });
        post.addVisitRecord(window.location.pathname, userip);
        post.getVisitCount(window.location.pathname, function(count){
            $('#article-visit-count').text(count);
        });
post.updatePostVersion(window.location.pathname);

{% elseif is_home() %}
var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
console.log(post);
$('.Card').each(function(){
    var post_url = $(this).attr('id');
    var true_url = $(this).find('.Card-title a').first().attr('href');
    var card = this;
    if(true_url.startsWith('http')){ //external link
        $(card).find('.Card-title a').first().click(function(e){
            post.updatePostVersion(post_url); 
        });
        $(card).find('.Card-excerpt a').first().click(function(e){
            post.updatePostVersion(post_url); 
        });
        $(card).find('.Card-figure a').first().click(function(e){
            post.updatePostVersion(post_url); 
        });
    }

    post.checkUpdate(post_url, function(post_url, hasUpdate){
        if(hasUpdate){
            $(card).find('mark.Card-badge').show();
        }else{
            $(card).find('mark.Card-badge').hide();
        } 
    });
        post.getCommentCount(post_url, function(count){
            $(card).find('.card-comment-count').first().text(count);
        });
        post.getVisitCount(post_url, function(count){
            $(card).find('.card-visit-count').first().text(count);
        });
    
});

{% elseif is_archive() || is_tag() || is_category() %}
var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
$('.Card-archive').each(function(){
    var post_url = $(this).attr('id');
    var true_url = $(this).find('.Card-title a').first().attr('href');
    var card = this;
    if(true_url.startsWith('http')){ //external link
        $(card).find('.Card-title a').first().click(function(e){
            post.updatePostVersion(post_url); 
        });
    }

    post.checkUpdate(post_url, function(post_url, hasUpdate){
        if(hasUpdate){
            $(card).find('mark.Card-badge').show();
        }else{
            $(card).find('mark.Card-badge').hide();
        }
    });
    post.getCommentCount(post_url, function(count){
        $(card).find('.card-comment-count').first().text(count);
    });
    post.getVisitCount(post_url, function(count){
        $(card).find('.card-visit-count').first().text(count);
    });
    
});
{% endif %}
</script>