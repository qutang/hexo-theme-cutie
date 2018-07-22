
{% set toc_level = parse_config([page.toc_level, site.data.cutie.post.toc_level, theme.post.toc_level]) %}

<div class='toc-container'>
<i class="far fa-times-circle" id='toc-close' onclick='closeTOC(event);' ontouchstart='closeTOC(event);'></i>
{{ toc(page.content, {list_number: true, max_depth: toc_level}) }}
</div>
<div class="toc-button" onclick='toggleTOC(event);' ontouchstart='toggleTOC(event);'>
    <img src="{{ '/images/icons/' + icon_set + '/toc.svg' }}" alt="">
</div>
