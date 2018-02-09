function disableHoverOnTouch() {
	window.addEventListener('touchstart', function() {
		// the user touched the screen!
		changeLayoutOnTouchScreen();
	});
}

function onClickMenuIcon(event) {
		if('ontouchstart' in document.documentElement){
			event.preventDefault();
			event.stopPropagation();
			
			ele = document.getElementById('nav-item-more');
			if(ele.classList.contains('active_dot'))
				ele.classList.remove('active_dot');
			else
				ele.classList.add('active_dot');
			var elems = document.getElementsByClassName('nav-more-menu');
			console.log(elems.length);
			[].forEach.call(elems, function(el) {
				console.log(el.style.display);
				if(!el.style.display || el.style.display == 'none')
					el.style.display = "block";
				else
					el.style.display = 'none';
			});
		}
}

function changeLayoutOnTouchScreen() {
	if('ontouchstart' in window        // works on most browsers 
      || navigator.maxTouchPoints){
		// remove all Card-hover class
		console.log('trigger change layout')
		var elems = document.querySelectorAll(".Card-hover");
		[].forEach.call(elems, function(el) {
			el.classList.remove("Card-hover");
		});

		// set to display exerpt and title together in cards
		elems = document.querySelectorAll(".Card-excerpt");
		[].forEach.call(elems, function(el) {
			el.classList.add("Card-excerpt-notouch")
		});
		// set to hide (tags) in cards, as it is involved in exerpt already
		elems = document.querySelectorAll(".Card-title-tags");
		[].forEach.call(elems, function(el) {
			el.style.display = "none";
		});
	}
}

function getLastVisitedVersion(path) {
	var name = document.getElementById(path).dataset['name'];
	var page_cookie = Cookies.getJSON(name);
	if(page_cookie == undefined){
		return undefined;
	}
	else{
		return page_cookie['last_visited_version'];
	}
}

function setVisitedVersion(name, version) {
	Cookies.set(name, {'last_visited_version': version}, {domain: window.location.hostname, expires: 365 * 3});
}

function isPostVisited(path) {
	var last_version = getLastVisitedVersion(path);
	var current_version = document.getElementById(path).dataset['version'];
	// first check if post is versioned
	if(current_version == -1){
		return true;
	}
	// then check if post has never been visited
	if(last_version == undefined){
		return false;
	}
	
	// then check if it's a newer version
	if(current_version > last_version){
		return false;
	}else{
		return true;
	}
}

function setVersionForCurrentPage(){
	if(window.location.pathname == '/' || window.location.pathname.match('\/page\/[0-9]+')){
	  var element = document.getElementById(window.location.pathname + 'index.html');
	  setVisitedVersion('index_page', element.dataset['version']);
	}else{
	  var element = document.getElementById(window.location.pathname);
	  setVisitedVersion(element.dataset['name'], element.dataset['version']);
	}
}

function setVersionBadgeForIndexPages(){
	if(window.location.pathname == '/' || window.location.pathname.match('\/page\/[0-9]+')){
		var cards = document.querySelectorAll("div.Card");
		for(var i=0; i<cards.length;i++){
		  var isVisited = isPostVisited(cards[i].id);
		  if(!isVisited){
			cards[i].querySelector('mark.Card-badge').style.visibility = 'visible';
			console.log('Set unread post title bold: ' + cards[i].dataset['name']);
		  }else{
			cards[i].querySelector('mark.Card-badge').style.visibility = 'hidden';
			// cards[i].querySelector('h2 a').style.fontWeight = 'normal';
		  }
		}
	  }
}

function fixCodeBlockForHighlightJs(){
	document.querySelectorAll('pre code').forEach(function(el){
		var classes = el.classList;
		var foundClassName;
		for(var cl in classes){
			console.log(classes.item(cl))
			if(classes.item(cl) != null && classes.item(cl).includes('language')){
				foundClassName = classes.item(cl).replace('language-', '');
				break;
			}
		}
		el.classList.add(foundClassName)
		hljs.highlightBlock(el);
	});
}

disableHoverOnTouch();