var Post = function(appId, appKey){
    try {
        AV.init({
            appId: appId,
            appKey: appKey
        }); 
    } catch (error) {
        
    }
    
    var obj = {
        getCommentCount: function(post_url, callback){
            var query = new AV.Query('Comment');
            query.equalTo('url', post_url);
            query.count().then(callback, function (error) {
            });
        },
        addVisitRecord: function(post_url, user_ip){
            var query = new AV.Query('Visit');
            query.equalTo('url', post_url).equalTo('ip', user_ip);
            query.count().then(function(count){
                if(count == 0){
                    var PostVisit = AV.Object.extend('Visit');
                    var newPostVisit = new PostVisit();
                    newPostVisit.set('url', post_url);
                    newPostVisit.set('ip', user_ip);
                    newPostVisit.save().then(function(oid){
                        console.log(oid);
                    }, function(error){
                        console.log(error);
                    });
                }else{
                    console.log(user_ip + ' already visited');
                }
            }, function(error){
                var PostVisit = AV.Object.extend('Visit');
                var newPostVisit = new PostVisit();
                newPostVisit.set('url', post_url);
                newPostVisit.set('ip', user_ip);
                newPostVisit.save().then(function(oid){
                    console.log(oid);
                }, function(error){
                    console.log(error);
                });
            });
        },
        getVisitCount: function(post_url, callback){
            var query = new AV.Query('Visit');
            query.equalTo('url', post_url);
            query.count().then(callback, function (error) {
            });
        }
    }
    return obj;
}
