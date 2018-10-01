function init_cards() {
	var mySwiper = new Swiper('.card .swiper-container', {
		// Optional parameters
		direction: 'horizontal',
        loop: true,
        fadeEffect: {
            crossFade: true
        },
    });
    
    var tags_el = document.querySelectorAll('.tags');
    var cover_el = document.querySelectorAll('.card-cover img');

    // BackgroundCheck.init({
    //     targets: tags_el,
    //     images: cover_el,
    //     threshold: 80,
    //     changeParent: true
    // });

    document.querySelectorAll('.card').forEach(function(el, ind, parent){
        el.querySelector('.card-next-button').addEventListener("click", function(e){
            el.querySelector('.swiper-container').swiper.slideNext();
        });

        el.querySelector('.swiper-container').swiper.on('slideChangeTransitionEnd', function(){
            if (el.querySelector('.swiper-slide-active').querySelector('.title-time-info')) {
				var tags_el = el.querySelector('.tags')
                anime({
                    targets: tags_el,
                    opacity: 1,
                    duration: 200,
                    easing: 'easeInOutSine'
                });
				var excerpt_el = el.querySelector('.card-excerpt');
                anime({
                    targets: excerpt_el,
                    opacity: 0,
                    duration: 200,
                    easing: 'easeInOutSine'
                });
			} else if (el.querySelector('.swiper-slide-active').querySelector('.insight-info')) {
				var tags_el = el.querySelector('.tags')
                anime({
                    targets: tags_el,
                    opacity: 0,
                    duration: 200,
                    easing: 'easeInOutSine'
                });
				var excerpt_el = el.querySelector('.card-excerpt');
                anime({
                    targets: excerpt_el,
                    opacity: 1,
                    duration: 200,
                    easing: 'easeInOutSine'
                });
			}
        });
    });
}

function init_post() {
    var mySwiper = new Swiper('.post .swiper-container', {
		// Optional parameters
		direction: 'horizontal',
        loop: true,
        fadeEffect: {
            crossFade: true
        },
        slidesPerView: 3,
        centeredSlides: true,
        spaceBetween: 10
    });
}

init_cards();
init_post();