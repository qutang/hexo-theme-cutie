
{% set comment_system = parse_config([site.data.cutie.global.comment_system, theme.global.comment_system]) %}

{% if comment_system === 'valine' %}
    {{ partial('_third_party/valine') }}
{% elseif comment_system === 'disqus' %}
    {{ partial('_third_party/disqus') }}
{% elseif comment_system === 'gitment' %}
    {{ partial('_third_party/gitment') }}
{% elseif comment_system === 'livere' %}
    {{ partial('_third_party/livere') }}
{% endif %}

{% set use_lightgallery = parse_config([site.data.cutie.post.use_lightgallery, theme.post.use_lightgallery]) %}

{% if use_lightgallery %}
    {{ partial('_third_party/lightgallery') }}
{% endif %}

{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = 1 %}
{% else %}
{% set use_post_stats = 0 %}
{% endif %}

{% if use_post_stats %}
    {{ partial('post-visit-comment-count-js') }}
{% endif %}

<!-- {{ js('js/post.js') }} -->

{{ js('js/headroom.min.js') }}

<script data-no-instant type='text/javascript'>

initHeadroom();

changeLayoutOnTouchScreen();

// {% if is_post() %}
// var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
// post.getCommentCount(window.location.pathname, function(count){
//     $('#article-comment-count').text(count);
// });
// post.addVisitRecord(window.location.pathname, userip);
// post.getVisitCount(window.location.pathname, function(count){
//     $('#article-visit-count').text(count);
// });

// {% elseif is_home() %}
// var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
// console.log(post);
// $('.Card').each(function(){
//     var post_url = $(this).attr('id');
//     var true_url = $(this).find('.Card-title a').first().attr('href');
//     var card = this;
//     post.getCommentCount(post_url, function(count){
//         $(card).find('.card-comment-count').first().text(count);
//     });
//     post.getVisitCount(post_url, function(count){
//         $(card).find('.card-visit-count').first().text(count);
//     });
    
// });

// {% elseif is_archive() || is_tag() || is_category() %}
// var post = new Post('{{ site.data.cutie.valine.appId }}', '{{ site.data.cutie.valine.appKey }}');
// $('.Card-archive').each(function(){
//     var post_url = $(this).attr('id');
//     var true_url = $(this).find('.Card-title a').first().attr('href');
//     var card = this;
//     post.getCommentCount(post_url, function(count){
//         $(card).find('.card-comment-count').first().text(count);
//     });
//     post.getVisitCount(post_url, function(count){
//         $(card).find('.card-visit-count').first().text(count);
//     });
    
// });
// {% endif %}
</script>

{{ partial('post-version-js') }}