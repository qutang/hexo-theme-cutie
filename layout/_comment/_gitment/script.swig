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
