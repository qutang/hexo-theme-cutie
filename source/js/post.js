var Post = (function () {
    function Post(appId, appKey) {
        this.forbid_request = false;
        try {
            AV.init({
                appId: appId | "",
                appKey: appKey | ""
            });
        } catch (error) {
            if(!appKey){
                this.forbid_request = true;
            }
        }

        var _addVisitRecord = function(post_url, user_ip){
            var PostVisit = AV.Object.extend('Visit');
            var newPostVisit = new PostVisit();
            newPostVisit.set('url', post_url);
            newPostVisit.set('ip', user_ip);
            newPostVisit.save().then(function (oid) {
                console.log(oid);
            }, function (error) {
                console.log(error);
            });
        }

        Post.prototype.getCommentCount = function (post_url, callback) {
            if(this.forbid_request) return;
            var query = new AV.Query('Comment');
            query.equalTo('url', post_url);
            query.count().then(callback, function (error) {
            });
        };
        Post.prototype.addVisitRecord = function (post_url, user_ip) {
            if(this.forbid_request) return;
            var query = new AV.Query('Visit');
            query.equalTo('url', post_url).equalTo('ip', user_ip);
            query.count().then(function (count) {
                if (count == 0) {
                    _addVisitRecord(post_url, user_ip);
                } else {
                    console.log(user_ip + ' already visited');
                }
            }, function (error) {
                _addVisitRecord(post_url, user_ip);
            });
        };
        Post.prototype.getVisitCount = function (post_url, callback) {
            if(this.forbid_request) return;
            var query = new AV.Query('Visit');
            query.equalTo('url', post_url);
            query.count().then(callback, function (error) {
            });
        };
        Post.prototype.getPostVersion = function(post_url){
            var name = document.getElementById(post_url).dataset['name'];
            var page_cookie = Cookies.getJSON(name);
            if(page_cookie == undefined){
                return undefined;
            }
            else{
                return page_cookie['last_visited_version'];
            }
        };
        var savePostVersion = function(post_name, post_version) {
            Cookies.set(post_name, {'last_visited_version': post_version}, {domain: window.location.hostname, expires: 365 * 3});
        };
        
        Post.prototype.updatePostVersion = function(post_url) {
            var element = document.getElementById(post_url);
            savePostVersion(element.dataset['name'], element.dataset['version']);
        };
        Post.prototype.checkUpdate = function (post_url, callback) {
            var last_version = Post.prototype.getPostVersion(post_url) | 0;
            var current_version = document.getElementById(post_url).dataset['version'];
            var hasUpdate = false;
            // first check if post is versioned
            if (current_version == -1) {
                hasUpdate = false;
            }
            // then check if post has never been visited
            if (last_version == undefined) {
                hasUpdate = true;
            }

            // then check if it's a newer version
            if (current_version > last_version) {
                hasUpdate = true;
            } else {
                hasUpdate = false;
            }

            callback(post_url, hasUpdate);
        };
    }
    return Post;
}
)();
