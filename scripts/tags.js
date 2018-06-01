hexo.extend.tag.register('bilibili', function(url){
    var aid_pattern = /[-_:/\.a-zA-z0-9]+\.bilibili\.com\/video\/av([0-9]+)\//gmiu
    while( (matches = aid_pattern.exec(url)) != null) {
        var aid = matches[1];
        return '<div class="video-container"><iframe src="//player.bilibili.com/player.html?aid=' + aid + '" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe></div>'
    }
    return ""
});