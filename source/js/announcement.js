/* 

script about annoucement behavior

*/
var Announcement = function(text){
  this.text = text;
  this.show = function(){
    var announcement = new Noty({
      type: 'info',
      layout: 'bottomLeft',
      text: this.text,
      timeout: 10000,
      theme: 'mint',
      id: 'announcement'
    });
    // check if user has seen this announcement
    var textHash = new Hashes.SHA256().hex(this.text);
    var cookieTextHash = Cookies.get('ANNOUNCEMENT');
    if(textHash === cookieTextHash){
      // dismiss, no need to show
      return;
    }else{
      // show announcement and save the announcement to cookie
      announcement.show();
      Cookies.set('ANNOUNCEMENT', textHash, {path: '', domain: window.location.hostname, expires: 365 * 3});
    }
  };
};