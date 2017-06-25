<style>
    body {
        background-color: white;
    }
</style>

<section class="page">
    <!-- Title -->
    <div class='article-header'>
         <h1 class='article-title'>
            <a href="{{ url_for(item.path) }}">
                {{ item.title }}
            </a>
        </h1>
    </div>
	<hr />
    <!-- Content -->
    {{ item.content | default("No content") }}
    <hr />
    <div class="social-share"></div>
</section>