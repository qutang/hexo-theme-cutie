{% if site.data.cutie %}
    {% set comment_system = site.data.cutie['global']['comment_system'] %}
{% else %}
    {% set comment_system = config.cutie['global']['comment_system'] %}
{% endif %}

  {% if comment_system === 'valine' %}
    <h2>{{ __('post.comment') }}</h2>
    <div id='valine'></div>
  {% elseif comment_system === 'disqus' %}
    <h2>{{ __('post.comment') }}</h2>
    <div id='disqus_thread'></div>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
  {% elseif comment_system === 'gitment' %}
    <h2>{{ __('post.comment') }}</h2>
    <div id='gitment'></div>
  {% endif %}