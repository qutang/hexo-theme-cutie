{% if is_home() %}
  <script>
  var cards = document.getElementsByClassName('Card');
  [].forEach.call(cards, function(el){
    var el_swiper = el.querySelector('.swiper-container');
    var slides = el_swiper.querySelectorAll('.swiper-slide');
    var icons = [];
    [].forEach.call(slides, function(slide){
      icons.push(slide.dataset.icon);
    });
    var mySwiper = new Swiper (el_swiper, {
      // Optional parameters
      direction: 'horizontal',
      loop: true,

      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // And if we need scrollbar
      scrollbar: {
        el: '.swiper-scrollbar',
      },

      pagination: {
        el: '.swiper-pagination',
        clickable: true,
        renderBullet: function (index, className) {
          return '<span class="' + className + '"><i class="fas fa-' + icons[index] + '"></i>' + '</span>';
        }
      }
    });

    var el_pagination = el.querySelector('.swiper-pagination');
    el_pagination.addEventListener('mouseover', function ( event ){
      el.classList.add('standout');
    })
    el_pagination.addEventListener('mouseenter', function( event ){
      if(!mySwiper.autoplay.running){
        mySwiper.params.autoplay.delay = 1500;
        mySwiper.params.autoplay.reverseDirection = false;
        mySwiper.params.autoplay.disableOnInteraction = false;
        mySwiper.autoplay.start();
      }
    });
    el_pagination.addEventListener('mouseleave', function(event ){
      mySwiper.autoplay.stop();
      el.classList.remove('standout');
    })
  });
  </script>
{% endif %}