{% set card_id = hashit(url_for(item.path)) %}
{% set card_name = item.title %}
{% set card_version = item.version %}
{% set card_cover = item.cover %}
{% set page_url = url_for(item.path) %}
{% if card_cover.startsWith('/') || card_cover.startsWith('http') %}
{% elseif card_cover %}
	{% set card_cover = page_url + card_cover %}
{% endif %}
{% set excerpt = partial('_variables/_page_and_post/excerpt', {item: item}) %}
{% set external_link = item.link | default(item.external_link) %}
{% set is_link_post = item.link || item.external_link %}
{% set title = item.title %}
{% set title_display = titlecase(item.title) | default("No title") %}
{% set archive_url = url_for('/archives/') %}
{% set comment_url = url_for(item.path + '/#article-comment') %}
{% set page_date = partial('_variables/_page_and_post/date', {item: item}) %}
{% set use_post_stats = partial('_variables/_page_and_post/use_stats') %}
{% set page_icon = item.icon %}

<div class='card card-index-{{ card_index }}' id='{{ card_id }}' data-name='{{ card_name }}' data-version='{{ card_version }}'>
	{{ partial('_gemini/_home_card/card_unread_dot') }}
	<div class="card-body" style='background-image: url("{{ generate_trianglify_image(title) }}")'>
	{% if card_cover %}
		<div class='card-cover'>
			<img src='{{ card_cover }}' />
		</div>
	{% endif %}
		{{ partial('_gemini/_home_card/card_excerpt', {excerpt: excerpt}) }}
		{{ partial('_gemini/_home_card/card_tags', {number_of_tags: 4, page_tags: item.tags}) }}
		{{ partial('_gemini/_home_card/swipe_button') }}
	</div>
	<div class="card-footer">
		{{ partial('_gemini/_home_card/card_icon', {is_link_post: is_link_post,
										  external_link: external_link,
										  page_url: page_url,
										  page_icon: page_icon,
										  title: title}) }}
		{{ partial('_gemini/_home_card/_card_nav/layout', {is_link_post: is_link_post,
												 external_link: external_link,
												 page_url: page_url,
												 title_display: title_display,
												 archive_url: archive_url,
												 comment_url: comment_url,
												 use_post_stats: use_post_stats,
												 page_date: page_date}) }}
	</div>
</div>