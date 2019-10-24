
$('#mgm_slider_banners').slick({
  slidesToShow:1,
  autoplay: false,
  arrows: true,
  dots:true,
  cssEase: 'linear',
  nextArrow: '<button class="slick-next slick-arrow next"><img src="/img/Forma-2-copia.png"/></button>',
    prevArrow: '<button class="slick-prev slick-arrow prev" ><img src="/img/Forma-1-copia.png"/></button>',
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        arrows: false,
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
  });

  $('#products-slider').slick({
    slidesToShow:3,
    autoplay: false,
    arrows: true,
    slidesToScroll:3,
    dots:true,
    nextArrow: '<button class="slick-next slick-arrow next"><img src="/img/Forma-2-copia.png"/></button>',
    prevArrow: '<button class="slick-prev slick-arrow prev" ><img src="/img/Forma-1-copia.png"/></button>',
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 1040,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
          arrows: false,
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: false,
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
    });
                            