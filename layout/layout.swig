<!DOCTYPE html>
<html lang="en">
{{ partial("_partial/head") }}
<body style="display: flex; flex-direction: column; min-height: 100vh;">
{{ partial("_partial/header") }}

  <!-- Primary Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <div style="flex: 1;">
      {{ body }}
  </div>

  {{ partial("_partial/footer") }}

  <br>

  <div id="footer-nav">
		{{ partial('_partial/nav', {position: 'footer'}) }}
	</div>

  {{ partial("_partial/after-footer") }}

<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
</body>
</html>
