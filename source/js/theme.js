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

function toggleTOC(event) {
	event.preventDefault();
	event.stopPropagation();
	var elems = document.querySelectorAll('#footer-nav .toc');
	console.log(elems.length);
	[].forEach.call(elems, function(el) {
		console.log(el.style.display);
		if(!el.style.display || el.style.display == 'none')
			el.style.display = "block";
		else
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

disableHoverOnTouch();