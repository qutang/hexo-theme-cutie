{% set announcement = site.data.cutie.global.announcement | default(theme.global.announcement) %}
{% if announcement && is_home() %}
  <script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
  <script>
      new Noty({
        type: 'info',
        layout: 'bottomLeft',
        text: '{{ announcement.text }}',
        timeout: 10000,
        theme: 'mint',
        id: 'announcement'
      }).show();
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

{% if item.announcement && is_post() %}
  <script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
  <script>
      new Noty({
        type: 'info',
        layout: 'bottomLeft',
        text: '{{ item.announcement.text }}',
        timeout: 10000,
        theme: 'mint',
        id: 'announcement'
      }).show();
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