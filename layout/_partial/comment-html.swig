{% if site.data.cutie %}
    {% set comment_system = site.data.cutie['global']['comment_system'] %}
{% else %}
    {% set comment_system = config.cutie['global']['comment_system'] %}
{% endif %}

  {% if comment_system === 'valine' %}
    <div id='valine'></div>
  {% elseif comment_system === 'disqus' %}
    <div id='disqus_thread'></div>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
  {% elseif comment_system === 'gitment' %}
    <div id='gitment'></div>
  {% endif %}