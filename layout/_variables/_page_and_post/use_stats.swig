{% if site.data.cutie.valine.appKey %} 
	{% set use_post_stats = true %} 
{% else %} 
	{% set use_post_stats = false %} 
{% endif %}

{{ use_post_stats }}