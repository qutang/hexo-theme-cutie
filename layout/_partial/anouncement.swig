{% set anouncement = site.data.cutie.global.anouncement | default(theme.global.anouncement) %}
{% if anouncement %}
  <div id='anouncement' class='anouncement'>
    <div>
      <p><span><i class='fas fa-bullhorn'></i> {{ anouncement }} <a href='#' onclick="document.getElementById('anouncement').style.display='none'"><i class='fas fa-times'></i></a></span></p>
    </div>
  </div>
{% endif %}