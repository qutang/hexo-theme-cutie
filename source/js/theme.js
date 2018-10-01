function disableHoverOnTouch() {
	window.addEventListener('touchstart', function () {
		// the user touched the screen!
		changeLayoutOnTouchScreen();
	});
}

function onClickMenuIcon(event) {
	if ('ontouchstart' in document.documentElement) {
		event.preventDefault();
		event.stopPropagation();
		var elems = document.getElementsByClassName('nav-more-menu');
		console.log(elems.length);
		[].forEach.call(elems, function (el) {
			console.log(el.style.display);
			if (!el.style.display || el.style.display == 'none')
				el.style.display = "block";
			else
				el.style.display = 'none';
		});
	}
}

function onClickNavMenuClose(event) {
	if ('ontouchstart' in document.documentElement) {
		event.preventDefault();
		event.stopPropagation();
		var elems = document.getElementsByClassName('nav-more-menu');
		console.log(elems.length);
		[].forEach.call(elems, function (el) {
			el.style.display = 'none';
		});
	}
}

function toggleTOC(e) {
	e = e || window.event;
	var src = e.target || e.srcElement;
	var elems = document.querySelectorAll('#article-toc .toc-container');
	console.log(elems.length);
	[].forEach.call(elems, function (el) {
		console.log(el.style.display);
		if (!el.style.display || el.style.display == 'none') {
			el.style.display = "block";
			src.classList.add('fa-rotate-90');
		}
		else {
			el.style.display = 'none';
			src.classList.remove('fa-rotate-90');
		}
	});
}

function closeTOC(event) {
	event.preventDefault();
	event.stopPropagation();
	var elems = document.querySelectorAll('#article-toc .toc-container');
	console.log(elems.length);
	[].forEach.call(elems, function (el) {
		console.log(el.style.display);
		el.style.display = 'none';
		document.querySelector('#toc-button i').classList.remove('fa-rotate-90');
	});
}

// function changeLayoutOnTouchScreen() {
// 	if ('ontouchstart' in window        // works on most browsers 
// 		|| navigator.maxTouchPoints) {
// 		// remove all Card-hover class
// 		console.log('trigger change layout')
// 		var elems = document.querySelectorAll(".Card-hover");
// 		[].forEach.call(elems, function (el) {
// 			el.classList.remove("Card-hover");
// 		});

// 		// set to display exerpt and title together in cards
// 		elems = document.querySelectorAll(".Card-excerpt");
// 		[].forEach.call(elems, function (el) {
// 			el.classList.add("Card-excerpt-touch");
// 			el.classList.remove('Card-excerpt');
// 		});
// 	}
// }

function initHeadroom() {
	var myElement = document.querySelector("header");
	// construct an instance of Headroom, passing the element
	var headroom = new Headroom(myElement, { offset: 40, tolerance: 30 });
	// initialise
	headroom.init();

	var footernav = document.querySelector('#footer-nav');
	var headroom3 = new Headroom(footernav, { offset: 40, tolerance: 30 });
	headroom3.init();
}

function initCard() {
	var mySwiper = new Swiper('.swiper-container', {
		// Optional parameters
		direction: 'horizontal',
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});

	// init card background
	$('.Card-background').each(function (index) {
		var pattern = Trianglify({ cell_size: 130, x_colors: 'random' });
		$(this).css('background-image', 'url(' + pattern.png() + ')');
	});

	$('.Card').each(function (index) {
		var card = this;
		$(card).find('.Card-next').click(function(e){
			$(card).find('.swiper-container').get(0).swiper.slideNext();
		});
		$(card).find('.swiper-container').get(0).swiper.on('slideChangeTransitionEnd', function () {
			if ($(card).find('.swiper-slide-active').find('.title-time-info').length) {
				$(card).find('.Card-tags').fadeIn('fast');
				$(card).find('.Card-excerpt').fadeOut('fast');
			} else if ($(card).find('.swiper-slide-active').find('.insight-info').length) {
				$(card).find('.Card-tags').fadeOut('fast');
				$(card).find('.Card-excerpt').fadeIn('fast');
			}
		});
	});
}

disableHoverOnTouch();