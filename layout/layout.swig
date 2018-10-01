{% set scheme_name = parse_config([site.data.cutie.global.scheme.name, theme.global.scheme.name]) %}

<!DOCTYPE html>
<html lang="en">
  {{ partial("_head/layout") }}
  <body>

    {{ partial("_scheme_switcher/_header", {scheme_name: scheme_name}) }}

    <div class="body-content">
        {{ body }}
    </div>

    {{ partial("_scheme_switcher/_footer", {scheme_name: scheme_name}) }}

    {{ partial("_scheme_switcher/_js", {scheme_name: scheme_name}) }}

    {{ partial("_announcement/layout", {page: page}) }}
    
    {{ partial("_tracker/layout") }}
  </body>
</html>
