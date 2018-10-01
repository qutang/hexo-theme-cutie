
{% set comment_system = parse_config([site.data.cutie.global.comment_system, theme.global.comment_system]) %}
<h1>{{ __('post.comment') }}</h1>
{% if comment_system === 'valine' %}
  {% if site.data.cutie.valine.appId %}
    {% set appId = site.data.cutie.valine.appId %}
    {% set appKey = site.data.cutie.valine.appKey %}
    {% set placeholder = site.data.cutie.valine.placeholder %}
    {% set lang = parse_config([config.language[0], "en"]) %}
    <div id='valine'></div>
    {{ partial('_comment/_valine/script', {appId: appId, appKey: appKey, placeholder: placeholder, lang: lang }) }}
  {% else %}
    <div id="comment-not-available">
      Not available
      <p><strong>For site maintainer: Please provide <code>appId</code> and <code>appKey</code> in your <code>_data/cutie.yml</code> file for <code>valine</code> comment system.</strong></p>
      {{ logger('warn', 'Valine comment system is not properly set up. Please provide "valine.appId" and "valine.appKey" in the _data/cutie.yml config file') }}
    </div>
  {% endif %}
{% elseif comment_system === 'disqus' %}
  {% if site.data.cutie.disqus.shortname %}
    {% set shortname = site.data.cutie.disqus.shortname %}
    <div id='disqus_thread'></div>
    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    {{ partial('_comment/_disqus/script', {shortname: shortname, url: url, path: path}) }}
  {% else %}
    <div id="comment-not-available">
      Not available
      <p><strong>For site maintainer: </strong>Please provide <code>shortname</code> in your <code>_data/cutie.yml</code> file for <code>disqus</code> comment system.</p>
      {{ logger('warn', 'Disqus comment system is not properly set up. Please provide "disqus.shortname" in the _data/cutie.yml config file') }}

    </div>
  {% endif %}
{% elseif comment_system === 'gitment' %}
  {% if site.data.cutie.gitment.client_secret %}
    {% set owner = site.data.cutie.gitment.owner %}
    {% set repo = site.data.cutie.gitment.repo %}
    {% set client_id = site.data.cutie.gitment.client_id %}
    {% set client_secret = site.data.cutie.gitment.client_secret %}
    <div id='gitment'></div>
    {{ partial('_comment/_gitment/script', {owner: owner, repo: repo, client_id: client_id, client_secret: client_secret}) }}
  {% else %}
    <div id="comment-not-available">
      Not available
      <p><strong>For site maintainer: </strong>Please provide <code>owner</code>, <code>repo</code>, <code>client_id</code>, and <code>client_secret</code> in your <code>_data/cutie.yml</code> file for <code>gitment</code> comment system.</p>
      {{ logger('warn', 'Gitment comment system is not properly set up. Please provide "gitment.owner", "gitment.repo", "gitment.client_id" and "gitment.client_secret" in the _data/cutie.yml config file') }}
    </div>
  {% endif %}
{% elseif comment_system === 'livere' %}
  {% set id = site.data.cutie.livere.id %}
  {% set uid = site.data.cutie.livere.uid %}
  {% if uid %}
    <div id="lv-container" data-id="{{ id }}" data-uid="{{ uid }}">
    {{ partial('_comment/_livere/script') }}
  {% else %}
    <div id="comment-not-available">
      Not available
      <p><strong>For site maintainer: </strong>Please provide <code>id</code>, <code>uid</code> in your <code>_data/cutie.yml</code> file for <code>livere</code> comment system.</p>
      {{ logger('warn', 'Livere comment system is not properly set up. Please provide "livere.id" and "livere.uid" in the _data/cutie.yml config file') }}
    </div>
  {% endif %}
{% endif %}
