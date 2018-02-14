<style>
    body {
        background-color: white;
    }
</style>


{% set icon_set = site.data.cutie.global.icon_set | default(theme.global.icon_set) %}

{% if config.language[0] === 'zh-cn' || config.language[0] === 'zh-tw' %}
	{% set year = item.date.format('YYYY') %}
	{% set month = item.date.format('MM') %}
	{% set day = item.date.format('DD') %}
	{% set meta_date = year + '年' + month + '月' + day + '日' %}
{% else %}
{% set meta_date = item.date.format(config.date_format) %}
{% endif %}

{% if item.categories && item.categories.length %}
    {% for cat in item.categories %}
        {% if loop.first %}
            {% set category_name = cat.name %}
            {% set category_link = url_for(cat.path) %}
        {% endif %}
    {% endfor %}
{% else %}
    {% set category_link = url_for(item.path) %}
    {% set category_name = 'uncategorized' %}
{% endif %}

{% set default_allow_share = site.data.cutie.post.allow_share | default(theme.post.allow_share) %}
{% set default_allow_modification = site.data.cutie.post.allow_modification | default(theme.post.allow_modification) %}
{% set default_allow_commercial = site.data.cutie.post.allow_commercial | default(theme.post.allow_commercial) %}
{% set allow_share = item.allow_share | default(default_allow_share) %}
{% set allow_modification = item.allow_modification | default(default_allow_modification) %}
{% set allow_commercial = item.allow_commercial | default(default_allow_commercial) %}
{% if allow_share == true %}
    {% set license = 'BY' %}
    {% if allow_commercial %}
    {% else %}
        {% set license = license + '-' + 'NC' %}
    {% endif %}

    {% if allow_modification %}
        {% set license = license + '-' + 'SA' %}
    {% else %}
        {% set license = license + '-' + 'ND' %}
    {% endif %}
{% else %}
    {% set license = __('post.no_share') %}
{% endif %}

{% set excerpt = trim(truncate(strip_html(item.content), {length: 300, separator: ' ', omission: '...'})) %}

<article class="article" id="{{ url_for(item.path) }}" data-name='{{ item.title }}' data-version="{{ item.version }}">

    <!-- Title -->
    <div class='article-header'>
         {% if item.icon %}
         <div class='article-logo'>
            <a href="#" data-no-instant>
                <img src="{{ item.icon }}" alt="" onerror='if(this.src != "/images/uncategorized.svg") this.src="/images/uncategorized.svg"'>
            </a>
         </div>
         {% endif %}
         <h1 class='article-title'>
            <a href="{{ url_for(item.path) }}">
                {{ titlecase(item.title) | default("No title") }}
            </a>
        </h1>
        <!-- TODO: support nested categories,display them nicely -->
        {% if item.categories && item.categories.length %}
        <ul class='article-categories'>
            {% for cat in item.categories %}
            {% set category_link = url_for(cat.path) %}
                <li><a href="{{ category_link }}" data-no-instant>
                    <img src="{{ '/images/' + cat.name + '.svg' }}" alt="{{ cat.name }}" onerror='if(this.src != "/images/uncategorized.svg") this.src="/images/uncategorized.svg"' title='{{ cat.name }}'/>
                </a></li>
            {% endfor %}
        </ul>
        {% endif %}
    </div>
    
    <!-- Date and Author -->
    <div class='article-meta'>
    <ul>
            <li><i class='fa fa-calendar'></i> {{ meta_date }}</li>
            <li><i class='fa fa-comments'></i> <a href='#article-comment'><span id='article-comment-count'>0</span></a></li>
            <li><i class="fa fa-eye"></i> <span id='article-visit-count'>0</span></li>
            <li><i class="fa fa-user"></i> {{ item.author.name | default(config.author) }}</li>
            {% if item.version && item.version > 0 %}
                <li><i class="fas fa-pen-square"></i> {{ item.version }}</li>
            {% endif %}
            <li><i class="fas fa-copyright"></i>
            {% if license !==  __('post.no_share') %}
                {% set license_name = 'CC ' + license + ' 4.0' %}
                {% set license_url = 'https://creativecommons.org/licenses/' + license + '/4.0/' %}
            {% else %}
                {% set license_name = license %}
                {% set license_url = 'mailto:' + site.data.cutie.maintainer.email %}
            {% endif %}
            {% if config.language[0] == 'zh-cn' %}
                {% if license !==  __('post.no_share') %}
                    {% set license_url = license_url + 'deed.zh' %}
                {% endif %}
                <a href={{license_url | lower }}>{{ license_name }}</a>
            {% else %}
                <a href={{license_url | lower }}>{{ license_name }}</a>
            {% endif %}
            </li>
    </ul>
    {{ partial("_partial/article-tags", {item: item}) }}
    </div>
    <div class='article-cards'>
        <!-- Author Card -->
        <!---
        <div class='Card-article Card-author'>
            <div class='card-title'>
                <h3></h3>
            </div>
            <div class='card-content'>
                    <div class="author-meta">
                            <div class='author-figure'>
                                <img src="" alt="">
                            </div>
                            <div class='author-name'>
                                {{ item.author.name | default(config.author) }}
                            </div>
                        </div>
                        <div class="author-ai">
                            <div class='author-intro'>
                                <!-- TODO: auto generating author description -->
                                <!-- {{ item.author.intro }}
                            </div>
                            <div class="author-articles">
                                <!-- TODO: auto generating author articles -->
                                <!-- <ul>
                                    <li>Article 1</li>
                                    <li>Article 2</li>
                                    <li>Article 3</li>
                                    <li>Article 4</li>
                                    <li>Article 5</li>
                                    <li>Article 6</li>
                                </ul>
                            </div>
                        </div>
            </div>
            
        </div> -->

        <!-- Visit Card -->
        <!-- <div class="Card-article Card-visit"> -->
            <!-- {{ partial('_partial/card-tschart',{title: "Post Visit", id: 'chart-post-visit'}) }} -->
        <!-- </div> -->
        
        <!-- Auto Excerpt Card -->
        <!-- <div class="Card-article Card-excerpt">
            {{ partial('_partial/card-text', {title: "Quick Read", id: 'text-post-summary', text: excerpt}) }}
        </div> -->
    </div>
    
    <!-- Gallery -->
    <!-- TODO: add a slider to gallery -->
    {% if item.photos && item.photos.length %}
        <div class='article-gallery' id='lightgallery'>
            {% for photo in item.photos %}
                <a class='article-gallery-item' href="{{ photo }}" data-no-instant>
                    <img src="{{ photo }}" alt="" />
                </a>
            {% endfor %} 
        </div>
    {% endif %}

    <!-- Content -->
    <!-- TODO: support table of content -->
    <div class="article-toc" id='article-toc'>
        {{ partial('_partial/toc', {item: item}) }}
    </div>
    <div class='article-content'>
    {{ item.content | default("No content") }}
    
    </div>
    {% if comment %}
        <div class="article-comment" id='article-comment'>
            {{ partial('_partial/comment-html') }}
        </div>
    {% endif %}
    <!-- <h2>{{ __('post.share') }}</h2>
    <div class="social-share"></div> -->
    
</article>