
<script>
    loadjs(['{{ theme.libs.noty.js }}', '{{ theme.libs.noty.css }}', '/js/announcement.js'], 'announcement');
    loadjs.ready('announcement', function() {
        new Announcement('{{ announcement.text }}').show();
    });
</script>