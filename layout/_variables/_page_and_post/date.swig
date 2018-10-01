{% if config.language[0] === 'zh-cn' || config.language[0] === 'zh-tw' %} 
 	{% set year = item.date.format('YYYY') %} 
	{% set month = item.date.format('MM') %} 
	{% set day = item.date.format('DD') %} 
	{% set page_date = year + '年' + month + '月' + day + '日' %} 
{% else %}
	{% set page_date = item.date.format(config.date_format) %} 
{% endif %}

{{ page_date }}