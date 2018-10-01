 {% if config.language[0] === 'zh-cn' || config.language[0] === 'zh-tw' %} {% set year = item.date.format('YYYY') %} {% set
month = item.date.format('MM') %} {% set day = item.date.format('DD') %} {% set meta_date = year + '年' + month + '月' + day
+ '日' %} {% else %} {% set meta_date = item.date.format(config.date_format) %} {% endif %} {% if site.data.cutie.valine.appKey
%} {% set use_post_stats = true %} {% else %} {% set use_post_stats = false %} {% endif %} {% set scheme = parse_config([site.data.cutie.global.scheme,
theme.global.scheme]) %}


<div class='Card Card-index-{{ index }}' id='{{ hashit(url_for(item.path)) }}' data-name='{{ item.title }}' data-version='{{ item.version }}'>
	{% if item.categories && item.categories.length %} {% for cat in item.categories %} {% if loop.first %} {% set category_link
	= url_for(cat.path) %} {% set category_name = cat.name %} {% endif %} {% endfor %} {% else %} {% set category_link = url_for(item.path)
	%} {% set category_name = "{{ url_for(generate_post_icon(item.title)) }}" %} {% endif %}
	<mark class='Card-badge' style='{visibility: "hidden"}'></mark>
	<div class="Card-body">
		<div class='Card-background'>
			<div class='Card-excerpt'>
				<p>
			 {% set excerpt = parse_config([item.abstract, item.excerpt, item.content, "No content"]) %} {% set excerpt =
							trim(truncate(strip_html(excerpt), {length: 150, separator: ' ', omission: '...'})) %} {{ excerpt }}
						
				</p>
			</div>
			<div class='Card-tags'>{{ partial('_partial/article-tags', {item: item, limit: 4}) }}</div>
			<div class="Card-next"><i class='fa fa-step-forward fa-lg'></i></div>
		</div>


	</div>

	<div class="Card-footer">
		<div class='Card-figure'>
			{% if item.link || item.external_link %}
			<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
				{% else %}
				<a href="{{ url_for(item.path) }}">
					{% endif %} {% if item.icon %}
					<img class='grow' src="{{ item.icon }}" alt="" onerror='this.src = "{{ generate_post_icon(item.title) }}"'> {% else %}
					<img class='grow' src="{{ category_name }}" alt="" onerror='this.src = "{{ generate_post_icon(item.title) }}"'> {% endif %}
				</a>
		</div>
		<div class="swiper-container">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide">
					<div class='title-time-info'>
						<h4>
							{% if item.link || item.external_link %}
							<a href="{{ item.link | default(item.external_link) }}" rel="noopener noreferrer" target="_blank">
								{% else %}
								<a href="{{ url_for(item.path) }}">
									{% endif %} {{ titlecase(item.title) | default("No title") }}</a>
						</h4>
						<p>
							<a href="{{ url_for('/archives/') }}">
								<i class='fa fa-calendar fa-lg'></i> {{ meta_date }}
							</a>
						</p>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="insight-info">
						<ul>
							{% if item.external_link %}
							<li>{{ __('external_link') }}</li>
							{% else %} {% if use_post_stats %}
							<li>
								<a href="{{ url_for(item.path + '/#article-comment') }}">
									<i class='fa fa-comments fa-lg'></i>
									<span class='card-comment-count'>0</span>
								</a>
							</li>
							<li>
								<i class="fa fa-users fa-lg"></i>
								<span class='card-visit-count'>0</span>
							</li>
							<li class='card-thumbup-container'>
								<i class="fa fa-heart-o fa-lg"></i>
								<span class='card-thumbup-count'>0</span>
							</li>
							{% endif %} {% endif %}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>