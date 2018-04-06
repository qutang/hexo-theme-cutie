
{% if is_home() %}
  {% set announcement = site.data.cutie.global.announcement | default(theme.global.announcement) %}
{% elif is_post() %}
  {% set announcement = item.announcement %}
{% endif %}

{% if announcement %}
<script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
<script>
    loadjs(['{{ theme.libs.noty.js_min }}', '{{ theme.libs.jshashes.js_min }}', '{{ theme.libs.jscookie.js }}', '/js/announcement.js'], 'announcement');
    loadjs.ready('announcement', {
      success: function(){
        new Announcement('{{ announcement.text }}').show();
      },
      error: function(err){
        console.log(err);
      }
    });
</script>

<style>
  #announcement{
    width: 40vw;
    padding: 0.1em;
  }
  #announcement a:link{
    color: white
  }
  #announcement a:visited{
    color: white
  }
</style>
{% endif %}