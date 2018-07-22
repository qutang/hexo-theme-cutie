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

function onClickNavMenuClose(event) {
	if('ontouchstart' in document.documentElement){
		event.preventDefault();
		event.stopPropagation();
		var elems = document.getElementsByClassName('nav-more-menu');
		console.log(elems.length);
		[].forEach.call(elems, function(el) {
			el.style.display = 'none';
		});
	}
}


function toggleTOC(event) {
	event.preventDefault();
	event.stopPropagation();
	var elems = document.querySelectorAll('#footer-nav .toc-container');
	console.log(elems.length);
	[].forEach.call(elems, function(el) {
		console.log(el.style.display);
		if(!el.style.display || el.style.display == 'none')
			el.style.display = "block";
		else
			el.style.display = 'none';
	});
}

function closeTOC(event) {
	event.preventDefault();
	event.stopPropagation();
	var elems = document.querySelectorAll('#footer-nav .toc-container');
	console.log(elems.length);
	[].forEach.call(elems, function(el) {
		console.log(el.style.display);
		el.style.display = 'none';
	});
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
			el.classList.add("Card-excerpt-touch");
			el.classList.remove('Card-excerpt');
		});
	}
}

function initHeadroom() {
	var myElement = document.querySelector("header");
	// construct an instance of Headroom, passing the element
	var headroom  = new Headroom(myElement, {offset: 40, tolerance: 30});
	// initialise
	headroom.init();

	var footernav = document.querySelector('#footer-nav');
	var headroom3 = new Headroom(footernav, {offset: 40, tolerance: 30});
	headroom3.init();
}

disableHoverOnTouch();