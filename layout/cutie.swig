<style>
    body {
        background-color: white;
    }
    #changelog-more {
        display: none;
    }
    #changelog-more-button {
        border-radius: 10px;
        width: 100%;
        border: 1px solid #aaa;
        padding: 3px;
        display: block;
        text-align: center;
    }
    .badges{
        text-align: center;
        margin-top: 2em;
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
    
<div class='badges'>
        <a href="https://github.com/qutang/hexo-theme-cutie/" target="_blank"><img src="https://img.shields.io/github/stars/qutang/hexo-theme-cutie.svg?style=social&label=Stars" alt=""></a>
        <a href="https://github.com/qutang/hexo-theme-cutie/" target="_blank"><img src="https://img.shields.io/github/forks/qutang/hexo-theme-cutie.svg?style=social&label=Fork" alt=""></a>
        <a href="https://github.com/qutang/hexo-theme-cutie/releases/latest/" target="_blank"><img src="https://img.shields.io/github/release/qutang/hexo-theme-cutie.svg" alt=""></a>
        <a href="https://github.com/qutang/hexo-theme-cutie/issues/" target="_blank"><img src="https://img.shields.io/github/issues/qutang/hexo-theme-cutie.svg" alt=""></a>
        <a href="https://github.com/qutang/hexo-theme-cutie/blob/master/LICENSE" target="_blank"><img src="https://img.shields.io/github/license/qutang/hexo-theme-cutie.svg" alt=""></a>
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
            <div id='changelog-display'>
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
            <div id='changelog-more'>
            {% for log in theme.changelog %}
                {% if loop.index >= 6 %}
                <h3><a href='https://github.com/qutang/hexo-theme-cutie/releases/tag/{{ loop.key }}' target='_blank'>{{ loop.key }}</a></h3>
                <ul>
                    {% for x in log %}
                        <li>{{ x }}</li>
                    {% endfor %}
                </ul>
                {% endif %}
            {% endfor %}
            </div>
            <a id='changelog-more-button' href='#changelog-more'>See more</a>
        </div>
        <h2>Tutorials</h2>
        <p><a href='/2018/02/12/hexo-theme-cutie-v2-tutorial/'>v2.x tutorial in English</a></p>
        <p><a href='/2017/06/27/Hexo-theme-cutie/'>v1.x tutorial in English</a></p>
        {{ page.content }}
        <h2>Aknowledgement</h2>
        <ul>
            {% for lib in theme.libs %}
                <li>{{ link_to(lib.url, lib.name, {external: true}) }}</li>
            {% endfor %}
        </ul>
        <h2>Copyright</h2>
        <div>
        <p>Copyright 2018 Qu Tang</p>

<p>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:</p>

<p>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.</p>

<p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.</p>
        </div>
</div>
</div>

<script>
    document.getElementById('changelog-more-button').onclick = function() {
        if(this.innerText === 'See more'){
            document.getElementById('changelog-more').style.display = 'block';
            document.getElementById('changelog-more').classList.add('animated');
            document.getElementById('changelog-more').classList.add('slideInLeft');
            this.setAttribute('href', '#changelog-display');
            this.innerText = 'Collapse changelogs';
        }else{
            this.setAttribute('href', '#changelog-more');
            document.getElementById('changelog-more').style.display = 'none';
            this.innerText = 'See more';
        }
    };
</script>