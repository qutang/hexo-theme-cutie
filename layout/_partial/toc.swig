
{% set toc_level = parse_config([page.toc_level, site.data.cutie.post.toc_level, theme.post.toc_level]) %}

<div class='toc-container'>
<i class="fa fa-times-circle fa-lg" id='toc-close' onclick='closeTOC(event);' ontouchstart='closeTOC(event);'></i>
{{ toc(page.content, {list_number: true, max_depth: toc_level}) }}
</div>
