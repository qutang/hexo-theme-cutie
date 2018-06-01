
{% if config.language[0] === 'zh-cn' || config.language[0] === 'zh-tw' %}
	{% set year = item.date.format('YYYY') %}
	{% set month = item.date.format('MM') %}
	{% set day = item.date.format('DD') %}
	{% set meta_date = year + '年' + month + '月' + day + '日' %}
{% else %}
{% set meta_date = item.date.format(config.date_format) %}
{% endif %}

{% if site.data.cutie.valine.appKey %}
{% set use_post_stats = true %}
{% else %}
{% set use_post_stats = false %}
{% endif %}


{% set scheme = parse_config([site.data.cutie.global.scheme, theme.global.scheme]) %}

{% set post_images = get_post_images(item, config.root) %}

{% set post_videos = get_post_videos(item, config.root) %}

{% set post_codes = get_post_codes(item) %}

{% set has_equations = has_math_equations(item) %}

<div class='Card Card-hover Card-index-{{ index }}' id='{{ hashit(url_for(item.path)) }}' data-name='{{ item.title }}' data-version='{{ item.version }}'>
	{% if item.categories && item.categories.length %}
		{% for cat in item.categories %}
			{% if loop.first %}
				{% set category_link = url_for(cat.path) %}
				{% set category_name = cat.name %}
			{% endif %}
		{% endfor %}
	{% else %}
		{% set category_link = url_for(item.path) %}
		{% set category_name = "uncategorized" %}
	{% endif %}
	<mark class='Card-badge' style='{visibility: "hidden"}'></mark>
	<div class="swiper-container">
		<div class="card-sparkle">
			<span title='Popular' class='popular-card'><i class="fas fa-lg fa-fire"></i></span>
			{% if post_codes|length > 0 %}
			{% set code = random_pick(post_codes) %}
			{% if code.lang == 'bash' %}
				<span title='Including {{ code.lang }}' class='coding-card'><i class="fas fa-lg fa-terminal"></i></span>
			{% elif code.lang == 'python' %}
				<span title='Including {{code.lang}}' class='coding-card'><i class="fab fa-lg fa-python"></i></span>
			{% elif code.lang == 'java' %}
				<span title='Including {{code.lang}}' class='coding-card'><i class="fab fa-lg fa-java"></i></span>
			{% elif code.lang == 'markdown' or code.lang == 'yaml' or code.lang == 'yml' %}
				<span title='Including {{code.lang}}' class='coding-card'><i class="fas fa-lg fa-list-alt"></i></span>
			{% elif code.lang == 'js' or code.lang == 'javascript' %}
				<span title='Including {{code.lang}}' class='coding-card'><i class="fab fa-lg fa-js"></i></span>
			{% else %}
				<span title='Including codes' class='coding-card'><i class="far fa-file-code fa-lg"></i></span>
			{% endif %}
			{% endif %}
			{% if has_equations %}
				<span title='Including equations' class='equation-card'><i class="fas fa-superscript fa-lg"></i></span>
			{% endif %}
			<!-- <span title='Github hosted' class='github-card'><i class="fab fa-lg fa-github"></i></span> -->
			
			{% if item.external_link %}
			<span title='External link' class='external-link-card'><i class="fas fa-lg fa-external-link-square-alt"></i></span>
			{% endif %}
			<span class="placeholder"></span>
		</div>
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
			<div class="swiper-slide title-slide" data-icon='font'>
				<div class="Card-body">
					<div class='Card-figure'>
						{% if item.link || item.external_link %}
							<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
						{% else %}
							<a href="{{ url_for(item.path) }}">
						{% endif %}
						{% if item.icon %}
							<img class='grow' src="{{ item.icon }}" alt="" onerror='if(this.src != "/images/uncategorized.svg") this.src = "/images/uncategorized.svg"'>
						{% else %}
							<img class='grow' src="{{ '/images/' + category_name + '.svg' }}" alt="" onerror='if (this.src != "/images/uncategorized.svg") this.src = "/images/uncategorized.svg"'>
						{% endif %}
						</a>
					</div>
					<div class='Card-title'>
						<h2>
						{% if item.link || item.external_link %}
							<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
						{% else %}
							<a href="{{ url_for(item.path) }}">
						{% endif %}
						{{ titlecase(item.title) | default("No title") }}</a></h2>
					</div>
				</div>
			</div>
			<div class="swiper-slide summary-slide" data-icon='align-justify'>
				<div class="Card-body">
					<div class='Card-excerpt'>
						<p>
						{% if item.link || item.external_link %}
							<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
						{% else %}
							<a href="{{ url_for(item.path) }}">
						{% endif %}
						{% set excerpt = parse_config([item.abstract, item.excerpt, item.content, "No content"]) %}
						{% set excerpt = trim(truncate(strip_html(excerpt), {length: 150, separator: ' ', omission: '...'})) %}
						{{ excerpt }}
						</a></p>
					</div>
				</div>
			</div>
			{% if post_images|length > 0 %}
			<div class="swiper-slide picture-slide" data-icon='camera-retro'>
				<div class="Card-body">
					<div class="Card-pictures">
						<img src="{{ random_pick(post_images) }}" alt="">
					</div>
				</div>
			</div>
			{% endif %}
			{% if post_videos|length > 0 %}
			<div class="swiper-slide video-slide" data-icon='video'>
				<div class="Card-body">
					<div class="Card-videos">
						{% set video = random_pick(post_videos) %}
						{% if video.type == 'youtube' || video.type == 'bilibili' %}
							<iframe class="center-block" src="{{ video.url }}" scrolling="no" framespacing="0" frameborder="0" allowfullscreen="true" align="center"></iframe>
						{% endif %}
					</div>
				</div>
			</div>
			{% endif %}
			{% set long_codes = [] %}
			{% for code in post_codes %}
				{% if code.lines > 3 %}
					{% set long_codes = long_codes.concat([code]) %}
				{% endif %}
			{% endfor %}
			{% if long_codes|length > 0 %}
			<div class="swiper-slide code-slide" data-icon='code'>
				<div class="Card-body">
					<div class="Card-codes">
							<figure class="highlight">
							{% set code = random_pick(long_codes) %}
							{{ code.content }}
							</figure>
					</div>
				</div>
			</div>
			{% endif %}
			<!-- <div class="swiper-slide insight-slide" data-icon='magic'>
				<div class="Card-body">
					<div class="Card-meta">
						{% if scheme.name == 'Taurus' %}
						<div class='Card-tags'>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</div>
						{% endif %}
						<ul>
								<li>
									<a href="{{ url_for('/archives/') }}">
										<i class='fa fa-calendar'></i> {{ meta_date }}
									</a>
								</li>
								{% if item.external_link %}
									<li>{{ __('external_link') }}</li>
								{% else %}
								{% if use_post_stats %}
								<li>
									<a href="{{ url_for(item.path + '/#article-comment') }}">
										<i class='fa fa-comments'></i> <span class='card-comment-count'>0</span>
									</a>
								</li>
								<li><i class="fa fa-eye"></i> <span class='card-visit-count'>0</span></li>
								{% endif %}
								{% endif %}
						</ul>
					</div>
				</div>
			</div> -->
			<div class="swiper-slide meta-slide" data-icon='info'>
					<div class="Card-body">
						<div class="Card-meta">
							{% if scheme.name == 'Taurus' %}
							<div class='Card-tags'>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</div>
							{% endif %}
							<ul>
									<li>
										<a href="{{ url_for('/archives/') }}">
											<i class='fa fa-calendar'></i> {{ meta_date }}
										</a>
									</li>
									{% if item.external_link %}
										<li>{{ __('external_link') }}</li>
									{% else %}
									{% if use_post_stats %}
									<li>
										<a href="{{ url_for(item.path + '/#article-comment') }}">
											<i class='fa fa-comments'></i> <span class='card-comment-count'>0</span>
										</a>
									</li>
									<li><i class="fa fa-eye"></i> <span class='card-visit-count'>0</span></li>
									{% endif %}
									{% endif %}
							</ul>
						</div>
					</div>
				</div>
		</div>
		
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>
		
	</div>
</div>