{% if site.data.cutie.valine.appId %}
    {% set valine_appid = site.data.cutie.valine.appId %}
    {% set valine_appkey = site.data.cutie.valine.appKey %}
    {% set valine_placeholder = site.data.cutie.valine.placeholder %}
<script>
    new Valine({
        el: '#valine',
        notify:false, 
        verify:false,
        appId: '{{ valine_appid }}',
        appKey: '{{ valine_appkey }}',
        placeholder: '{{ valine_placeholder }}',
        path:window.location.pathname, 
        avatar:'retro',
        lang: '{{ parse_config([config.language[0], "en"]) }}'
    });
</script>
{% endif %}

