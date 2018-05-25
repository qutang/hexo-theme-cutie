
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
			<span title='Including python' class='coding-card'><i class="fab fa-lg fa-python"></i></span>
			<span title='Github hosted' class='github-card'><i class="fab fa-lg fa-github"></i></span>
		</div>
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->
			<div class="swiper-slide">
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
			<div class="swiper-slide">
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
			<div class="swiper-slide">
				<div class="Card-body">
					<div class="Card-pictures">
						<img src="http://i.dtinews.vn/stores/news_dataimages/namhang/052011/09/10/images201656_PM20110509104758.jpg" alt="">
					</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="Card-body">
					<div class="Card-codes">
							<figure class="highlight yml">
<pre><span class="line"><span class="attr">highlight:</span></span><br><span class="line"><span class="attr">  enable:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">  line_number:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">  auto_detect:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">  tab_replace:</span> </span><br><span class="line"><span class="attr">markdown:</span></span><br><span class="line"><span class="attr">  render:</span></span><br><span class="line"><span class="attr">    html:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">    xhtmlOut:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">    breaks:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">    linkify:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">    typographer:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">    quotes:</span> <span class="string">'“”‘’'</span></span><br><span class="line"><span class="attr">  plugins:</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-abbr</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-footnote</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-ins</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-sub</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-sup</span></span><br><span class="line"><span class="bullet">    -</span> <span class="string">markdown-it-deflist</span></span><br><span class="line"><span class="attr">  anchors:</span></span><br><span class="line"><span class="attr">    level:</span> <span class="number">1</span></span><br><span class="line"><span class="attr">    collisionSuffix:</span> <span class="string">'v'</span></span><br><span class="line"><span class="attr">    permalink:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">    permalinkClass:</span> <span class="string">header-anchor</span></span><br><span class="line"><span class="attr">    permalinkSymbol:</span> <span class="string">""</span></span><br><span class="line"><span class="attr">    permalinkBefore:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">date_format:</span> <span class="string">ll</span></span><br><span class="line"><span class="attr">archive_generator:</span></span><br><span class="line"><span class="attr">  per_page:</span> <span class="number">0</span></span><br><span class="line"><span class="attr">  yearly:</span> <span class="literal">true</span></span><br><span class="line"><span class="attr">  monthly:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">  daily:</span> <span class="literal">false</span></span><br><span class="line"><span class="attr">theme:</span> <span class="string">cutie</span></span><br></pre>
								</figure>
					</div>
				</div>
			</div>
			<div class="swiper-slide">
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
			<div class="swiper-slide">
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