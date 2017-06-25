function disableHoverOnTouch() {
	window.addEventListener('touchstart', function() {
		// the user touched the screen!
		changeLayoutOnTouchScreen();
	});
}

function changeLayoutOnTouchScreen() {
	// remove all Card-hover class
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

disableHoverOnTouch();