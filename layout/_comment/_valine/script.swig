{{ js(theme.libs.valine.js) }}
<script>
    new Valine({
        el: '#valine',
        notify:false, 
        verify:false,
        appId: '{{ appId }}',
        appKey: '{{ appKey }}',
        placeholder: '{{ placeholder }}',
        path:window.location.pathname, 
        avatar:'retro',
        lang: '{{ lang }}'
    });
</script>

