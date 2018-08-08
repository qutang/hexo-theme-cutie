var LeanCloud = (function () {
    var instance;
    var appId;
    var appKey;

    var _LeanCloud = function (appId, appKey) {
        this.forbid_request = false;
        try {
            AV.init({
                appId: appId | "",
                appKey: appKey | ""
            });
        } catch (error) {
            if (!appKey) {
                this.forbid_request = true;
            }
        }

        var _addVisitRecord = function (post_url, user_ip) {
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

        var _addThumbUpRecord = function (post_url, user_ip) {
            var PostThumbUp = AV.Object.extend('ThumbUp');
            var newPostThumbUp = new PostThumbUp();
            newPostThumbUp.set('url', post_url);
            newPostThumbUp.set('ip', user_ip);
            newPostThumbUp.save().then(function (oid) {
                console.log(oid);
            }, function (error) {
                console.log(error);
            });
        }

        var _removeThumbUpRecord = function (post_url, user_ip) {
            var query = new AV.Query('ThumbUp');
            query.equalTo('url', post_url).equalTo('ip', user_ip);
            query.first().then(function (obj) {
                obj.destroy().then(function (success) {
                    console.log('Removed thumb up');
                }, function (error) {
                    console.log(error)
                })
            }, function (error) {
                console.log(error);
            });
        }

        this.addVisitRecord = function (post_url, user_ip) {
            if (this.forbid_request) return;
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

        this.addThumbUpRecord = function (post_url, user_ip) {
            if (this.forbid_request) return;
            var count = Cookies.get("THUMBUP_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            Cookies.set('THUMBUP_COUNT_hashit_' + new Hashes.SHA256().hex(post_url), count + 1);
            var query = new AV.Query('ThumbUp');
            query.equalTo('url', post_url).equalTo('ip', user_ip);
            query.count().then(function (count) {
                if (count == 0) {
                    Cookies.set("IS_THUMBUP_hashit_" + new Hashes.SHA256().hex(post_url), true);
                    _addThumbUpRecord(post_url, user_ip);
                } else {
                    console.log(user_ip + ' already thumbed up');
                }
            }, function (error) {
                console.log(error);
            });
        }

        this.removeThumbUpRecord = function (post_url, user_ip) {
            if (this.forbid_request) return;
            Cookies.remove("IS_THUMBUP_hashit_" + new Hashes.SHA256().hex(post_url));
            var count = Cookies.get("THUMBUP_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            Cookies.set('THUMBUP_COUNT_hashit_' + new Hashes.SHA256().hex(post_url), count - 1);
            _removeThumbUpRecord(post_url, user_ip);
        }

        this.getCommentCount = function (post_url, callback) {
            var count = Cookies.get("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            callback(count);
            setInterval(function () {
                var count = Cookies.get("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
                callback(count);
            }, 3 * 1000);
        }

        this.getVisitCount = function (post_url, callback) {
            var count = Cookies.get("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            callback(count);
            setInterval(function () {
                var count = Cookies.get("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
                callback(count);
            }, 3 * 1000);
        }

        this.getThumbUpCount = function (post_url, callback) {
            var count = Cookies.get("THUMBUP_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
            callback(count);
            setInterval(function () {
                var count = Cookies.get("THUMBUP_COUNT_hashit_" + new Hashes.SHA256().hex(post_url)) | 0;
                callback(count);
            },  3*1000);
        }

        this.isThumbUp = function (post_url, callback) {
            var isThumbUp = Boolean(Cookies.get("IS_THUMBUP_hashit_" + new Hashes.SHA256().hex(post_url))) | false;
            callback(isThumbUp);
        }

        this.fetchCommentCount = function (post_url) {
            setTimeout(function () {
                if (this.forbid_request) {
                    console.log("LeanCloud request is forbidden because the object is not initialized correctly");
                    return;
                }
                var query = new AV.Query('Comment');
                query.equalTo('url', post_url);
                query.count().then(function (count) {
                    Cookies.set("COMMENT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url), count);
                }, function (error) {
                    console.log("error" + error + " when query Comment count for " + post_url);
                });
            }, Math.random() * 2000);
        };

        this.fetchVisitCount = function (post_url) {
            setTimeout(function () {
                if (this.forbid_request) return;
                var query = new AV.Query('Visit');
                query.equalTo('url', post_url);
                query.count().then(function (count) {
                    Cookies.set("VISIT_COUNT_hashit_" + new Hashes.SHA256().hex(post_url), count);
                }, function (error) {
                    console.log("error" + error + " when query Visit count for " + post_url);
                });
            }, Math.random() * 2000);
        };

        this.fetchThumbUpCount = function (post_url) {
            setTimeout(function () {
                if (this.forbid_request) return;
                var query = new AV.Query('ThumbUp');
                query.equalTo('url', post_url);
                query.count().then(function (count) {
                    Cookies.set("THUMBUP_COUNT_hashit_" + new Hashes.SHA256().hex(post_url), count);
                }, function (error) {
                    console.log("error" + error + " when query Visit count for " + post_url);
                });
            }, Math.random() * 2000);
        };

        this.fetchIsThumbUp = function (post_url, user_ip) {
            setTimeout(function () {
                if (this.forbid_request) return;
                var query = new AV.Query('ThumbUp');
                query.equalTo('url', post_url).equalTo('ip', user_ip);
                query.count().then(function (count) {
                    if (count > 0) {
                        Cookies.set("IS_THUMBUP_hashit_" + new Hashes.SHA256().hex(post_url), true);
                    }
                }, function (error) {
                    console.log("error" + error + " when query thumbup for " + post_url);
                });
            }, Math.random() * 2000);
        };
    }

    function createInstance() {
        var leanCloud = new _LeanCloud(appId, appKey);
        return leanCloud;
    }

    return {
        getInstance: function () {
            if (!instance) {
                instance = createInstance();
            }
            return instance;
        },
        init: function (id, key) {
            appId = id;
            appKey = key;
        }
    }
})();