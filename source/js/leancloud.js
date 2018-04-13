var LeanCloud = (function(){
    var instance;
    var appId;
    var appKey;
    
    var _LeanCloud = function(appId, appKey){
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

        this.addVisitRecord = function(post_url, user_ip){
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
        }

        this.getCommentCount = function(post_url, callback){
            var count = Cookies.get("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            callback(count);
            setInterval(function(){
                var count = Cookies.get("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
                callback(count);
            }, 3 * 1000);
        }

        this.getVisitCount = function(post_url, callback){
            var count = Cookies.get("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            callback(count);
            setInterval(function(){
                var count = Cookies.get("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
                callback(count);
            }, 3 * 1000);
        }

        this.fetchCommentCount = function (post_url) {
            setTimeout(function(){
                if(this.forbid_request) {
                    console.log("LeanCloud request is forbidden because the object is not initialized correctly");
                    return;
                }
                var query = new AV.Query('Comment');
                query.equalTo('url', post_url);
                query.count().then(function(count){
                    Cookies.set("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url), count);
                }, function (error) {
                    console.log("error" + error + " when query Comment count for " + post_url);
                });
            }, Math.random() * 2000);
        };

        this.fetchVisitCount = function (post_url) {
            setTimeout(function(){
                if(this.forbid_request) return;
                var query = new AV.Query('Visit');
                query.equalTo('url', post_url);
                query.count().then(function(count){
                    Cookies.set("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url), count);
                }, function (error) {
                    console.log("error" + error + " when query Visit count for " + post_url);
                });
            }, Math.random() * 2000);
        };
    }

    function createInstance(){
        var leanCloud = new _LeanCloud(appId, appKey);
        return leanCloud;
    }

    return {
        getInstance: function() {
            if (!instance){
                instance = createInstance();
            }
            return instance;
        },
        init: function(id, key) {
            appId = id;
            appKey = key;
        }
    }
})();