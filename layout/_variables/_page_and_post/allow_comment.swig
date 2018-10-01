{% set allow_comment = parse_config([item.allow_comment, site.data.cutie.post.allow_comment, theme.post.allow_comment]) %}

{{ allow_comment }}