{% if site.data.cutie %}
    {% set owner = site.data.cutie['gitment']['owner'] %}
    {% set repo = site.data.cutie['gitment']['repo'] %}
    {% set client_id = site.data.cutie['gitment']['client_id'] %}
    {% set client_secret = site.data.cutie['gitment']['client_secret'] %}
{% else %}
    {% set owner = config.cutie['gitment']['owner'] %}
    {% set repo = config.cutie['gitment']['repo'] %}
    {% set client_id = config.cutie['gitment']['client_id'] %}
    {% set client_secret = config.cutie['gitment']['client_secret'] %}
{% endif %}

<script>
var gitment = new Gitment({
  id: window.location.pathname, // optional
  owner: '{{ owner }}',
  repo: '{{ repo }}',
  oauth: {
    client_id: '{{ client_id }}',
    client_secret: '{{ client_secret }}',
  },
  // ...
  // For more available options, check out the documentation below
})

gitment.render('gitment')
</script>