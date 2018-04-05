<style>
        body {
            background-color: white;
        }
    </style>


<div class='article'>
<div class="article-header">
    <br>
    <h1 class='article-title' style='width: 100%; text-align:center'>
        {{ titlecase("Hexo theme: Cutie") }}
    </h1>
    <br>
</div>
<div class='article-content'>
        <h2>Introduction</h2>
        <p>Theme cutie is a clean and responsive hexo theme that favors multiple schemes, flexible configuration and unique human interaction features.</p>
        <blockquote>
            <img src="archive.png" alt="">
            <img src="home-mobile.png" alt="">
            <img src="home.png" alt="">
            <img src="post-mobile.png" alt="">
            <img src="post.png" alt="">
        </blockquote>
        
        <h2>Change logs</h2>
        <div class='changelog'>
            {% for log in theme.changelog %}
                {% if loop.index < 6 %}
                <h3><a href='https://github.com/qutang/hexo-theme-cutie/releases/tag/{{ loop.key }}' target='_blank'>{{ loop.key }}</a></h3>
                <ul>
                    {% for x in log %}
                        <li>{{ x }}</li>
                    {% endfor %}
                </ul>
                {% endif %}
            {% endfor %}
        </div>
        <h2>Tutorials</h2>
        <p><a href='/2018/02/12/hexo-theme-cutie-v2-tutorial/'>v2.x tutorial in English</a></p>
        <p><a href='/2017/06/27/Hexo-theme-cutie/'>v1.x tutorial in English</a></p>
        <h2>Aknowledge</h2>
</div>
</div>