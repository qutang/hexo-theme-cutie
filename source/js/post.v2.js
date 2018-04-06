var Postv2 = function(id){
  this.id = id;
  this.showUnreadNotification = function(contentHash, showingCallback, notShowingCallback){
    var cookieContentHash = Cookies.get('CONTENT_' + this.id);
    if(contentHash !== cookieContentHash){
      showingCallback();
    }else{
      notShowingCallback();
    }
  }
  this.update = function(contentHash, afterCallback){
    Cookies.set('CONTENT_' + this.id, contentHash, {domain: window.location.hostname, expires: 365 * 3});
    afterCallback();
  }
};