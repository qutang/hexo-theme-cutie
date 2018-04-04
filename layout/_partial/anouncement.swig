{% set anouncement = site.data.cutie.global.anouncement | default(theme.global.anouncement) %}
{% if anouncement && is_home() %}
  <script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
  <script>
      new Noty({
        type: 'info',
        layout: 'bottomLeft',
        text: '{{ anouncement.text }}',
        timeout: 10000,
        theme: 'mint',
        id: 'anouncement'
      }).show();
    </script>
  <style>
    #anouncement{
      width: 40vw;
      padding: 0.1em;
    }
    #anouncement a:link{
      color: white
    }
    #anouncement a:visited{
      color: white
    }
  
  </style>
{% endif %}

{% if item.anouncement && is_post() %}
  <script type='text/javascript' src='{{ theme.libs.noty.js_min }}'></script>
  <script>
      new Noty({
        type: 'info',
        layout: 'bottomLeft',
        text: '{{ item.anouncement.text }}',
        timeout: 10000,
        theme: 'mint',
        id: 'anouncement'
      }).show();
    </script>
  <style>
    #anouncement{
      width: 40vw;
      padding: 0.1em;
    }
    #anouncement a:link{
      color: white
    }
    #anouncement a:visited{
      color: white
    }
  
  </style>
{% endif %}