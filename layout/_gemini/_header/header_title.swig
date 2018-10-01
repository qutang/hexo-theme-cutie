{% set home_url = url_for('/') %}

<div class="header-title">
    <div class='header-logo'>
        <a href="{{ home_url }}">
            <img src='{{ site_logo }}' />
        </a>
    </div>
    <div class='header-text'>
        <h1>
            <a href="{{ home_url }}">{{ site_title }}</a>
        </h1>
        <p>
            {{ site_subtitle }}
        </p>
    </div>
</div>