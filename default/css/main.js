;

$(document).ready(function () {
	'use strict';
	
    new WOW().init();
    $('header').scrollToFixed({ zIndex: 110 });
    $(window).bind('scroll', function () {
        if ($(window).scrollTop() > 100) {
            $('header').addClass('minimal');
        } else {
            $('header').removeClass('minimal');
        }
    });

    $(window).bind('scroll', function () {
        if ($(window).scrollTop() > 100) {
            $('.up').addClass('appear');
        } else {
            $('.up').removeClass('appear');
        }
    });

    $('.up').on('click', function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
    });

    $('.btn-showmenu').click(function () {
        $('.menu').toggleClass('open');
        $('html').css('overflow', 'auto');
        $(this).toggleClass('active');
        $('.overlay').fadeIn(500);
    });

    $('.btn-closemenu').click(function () {
        $('.menu').removeClass('open');
        $('html').css('overflow', 'auto');
        $('.btn-showmenu').removeClass('active');
        $('.overlay').fadeOut(500);
    });

    $('.overlay').click(function () {
        $(this).fadeOut(500);
        $('.menu').removeClass('open');
        $('.search').removeClass('open');
        $('html').css('overflow', 'auto');
        $('.btn-showmenu').removeClass('active');
    });
    $('.searchtoggle').click(function () {
        $('.search').toggleClass('open');
        $('.overlay').fadeIn(500);
        $('.menu').removeClass('open');
        // $('html').css('overflow', 'hidden');
    });
    $('.btn-showmega').click(function () {
        $('.mega').fadeIn(300);
    });
    $('.btn-closemega').click(function () {
        $('.mega').fadeOut(300);
    });
    $('.btn-showsub').click(function () {
        $('.sub').slideToggle(300);
    });
    $('.btn-show-tabs').click(function () {
        $('.nav-tabs').slideToggle(300);
    });
    $('.btn-shownav').click(function () {
        $('.product-description .nav-tabs,.about-link ul,.sidebar-category ul').slideToggle(300);
    });
    //BANNER
    $('.banner').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        speed: 1000,
        autoplay: true,
        autoplaySpeed: 5000,
        dots: false,
        arrows: true
    });
    $('.list-sale').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 1000,
        dots: true,
        arrows: false
    });
    $('.list-expert').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 1000,
        dots: true,
        arrows: false
    });
    $('.list-solution').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        autoplay: true,
        autoplaySpeed: 3000,
        responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 567,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }]
    });
    $('.list-news').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 3
            }
        }]
    });
    //PRODUCT
    $('.list-product').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        lazyLoad: 'ondemand',
        arrows: true,
        dots: false,
        speed: 500,
        // autoplay: true,
        autoplaySpeed: 5000,
        responsive: [{
            breakpoint: 1199,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3,
                infinite: true,
                dots: true
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        }, {
            breakpoint: 480,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 1
            }
        }]
    });

    $('.prd-home a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

        e.preventDefault();
        var id = $(this).attr('href');
        $(id + ' .list-product').slick('unslick');

        $(id + ' .list-product').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            lazyLoad: 'ondemand',
            arrows: true,
            dots: false,
            speed: 500,
            autoplay: true,
            autoplaySpeed: 5000,
            responsive: [{
                breakpoint: 1199,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            }, {
                breakpoint: 767,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            }, {
                breakpoint: 480,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            }]
        });
        //  $(id + " .slick-slider").hide();      
        //  $(id + ' .slick-next').trigger('click');
        //  $(id + " .slick-slider").show();    
        //$(id + ' .prd-related , .prdzone-slide').resize();product-zone-list
    });

    $('.product-slide').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: false,
        infinite: false,
        fade: true,
        asNavFor: '.product-nav'
    });
    $('.product-nav').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.product-slide',
        dots: false,
        focusOnSelect: true,
        swipe: true,
        swipeToSlide: true,
        vertical: true,
        verticalSwiping: true,
        responsive: [{
            breakpoint: 1199,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 991,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 4
            }
        }, {
            breakpoint: 543,
            settings: {
                slidesToShow: 3,
                vertical: false,
                verticalSwiping: false
            }
        }]
    });
    $('.lastview-slide').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        dots: false,
        arrows: true,
        autoplay: false,
        speed: 500,
        responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 3
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 2
            }
        }]
    });
    //IMAGE HOVER
    $(document).on('mouseenter', '.category-step [data-toggle="tab"]', function () {
        $(this).tab('show');
    });
    // FILTER
    $('.btn-showcate').click(function () {
        $('.filter-category').addClass('open');
    });
    $('.btn-closefilter').click(function () {
        $('.filter-wrap').removeClass('open');
    });

    //CART
    $('#btn-xuathd').click(function () {
        $('.bill-form').slideToggle(300);
    });
    $('.cart-lastview-slide').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        responsive: [{
            breakpoint: 1199,
            settings: {
                slidesToShow: 4,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        }, {
            breakpoint: 543,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        }]
    });

    //store
    $('.store .storebox').click(function () {
        var _parent = $(this).parent();
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            _parent.find('.storecontent').slideUp(300);
        } else {
            $('.store .storebox').removeClass('active');
            $('.store .storecontent').slideUp();
            $(this).addClass('active');
            _parent.find('.storecontent').slideDown(300);
        }
    });

    $('.map-ifarme').fancybox({
        type: "iframe",
        padding: 0,
        maxWidth: 800,
        maxHeight: 460,
        // 'autoDimensions':   true,
        // fitToView: false,
        iframe: {
            preload: false
        },
        helpers: {
            overlay: {
                locked: false
            }
        }
    });
    // HISTORY SLIDE

    $('.history-img').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 800,
        dots: false,
        fade: false,
        arrows: false,
        asNavFor: '.history-slide'
    });
    $('.history-year').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 500,
        dots: false,
        fade: false,
        arrows: true,
        asNavFor: '.history-slide'
    });
    $('.history-content').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 500,
        dots: false,
        fade: false,
        arrows: false,
        asNavFor: '.history-slide'
    });
    $('.history-nav').slick({
        slidesToShow: 13,
        slidesToScroll: 1,
        dots: false,
        focusOnSelect: true,
        asNavFor: '.history-slide',
        responsive: [{
            breakpoint: 991,
            settings: {
                slidesToShow: 10,
                slidesToScroll: 1
            }
        }, {
            breakpoint: 767,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        }]

    });
    $(".block-sidebarCateWrap").prependTo(".newspage-sidebarWrap");
    // DISABLE SCROLL MAP
    $('#map').click(function () {
        $(this).find('iframe').addClass('active');
    }).mouseleave(function () {
        $(this).find('iframe').removeClass('active');
    });

    if ($(window).width() < 767) {
        $('.newspage-sidebarWrap').insertBefore($('.news-detail,.news-sale-detail'));
    }
	
	//VIEW MORE
	var height = $('.product-description .tab-content .content').html().length	;
	console.log(height);
	$('.product-description ul li a').on('click',function(){
		if(height > 300 ){
			$('.btn-readmore').css('display','block');
			$(height).addClass('sdfs');
		}
	});
	
	
	$('.btn-readop1').click(function () {
		$('.product-description .tab-content .content-op1').toggleClass('open');
	});
});

// // REVOLUTION SLIDER
// var tpj = jQuery;

// var banner001;
// tpj(document).ready(function() {
//     if (tpj("#banner001").revolution == undefined) {
//         revslider_showDoubleJqueryError("#banner001");
//     } else {
//         banner001 = tpj("#banner001").show().revolution({
//             sliderType: "standard",
//             sliderLayout: 'fullscreen',
//             dottedOverlay: "none",
//             delay: 5000,
//             navigation: {
//                 keyboardNavigation: "off",
//                 keyboard_direction: "horizontal",
//                 mouseScrollNavigation: "off",
//                 onHoverStop: "off",
//                 touch: {
//                     touchenabled: "on",
//                     swipe_threshold: 75,
//                     swipe_min_touches: 50,
//                     swipe_direction: "horizontal",
//                     drag_block_vertical: false
//                 },
//                 arrows: {
//                     enable: true,
//                     style: 'uranus',
//                     tmp: '',
//                     rtl: false,
//                     hide_onleave: true,
//                     hide_onmobile: true,
//                     hide_under: 0,
//                     hide_over: 9999,
//                     hide_delay: 300,
//                     hide_delay_mobile: 1200,
//                     left: {
//                         container: 'slider',
//                         h_align: 'left',
//                         v_align: 'center',
//                         h_offset: 20,
//                         v_offset: 0
//                     },

//                     right: {
//                         container: 'slider',
//                         h_align: 'right',
//                         v_align: 'center',
//                         h_offset: 20,
//                         v_offset: 0
//                     }
//                 },
//                 bullets: {
//                     enable: false,
//                     style: 'hermes',
//                     tmp: '',
//                     direction: 'horizontal',
//                     rtl: false,

//                     container: 'slider',
//                     h_align: 'center',
//                     v_align: 'bottom',
//                     h_offset: 0,
//                     v_offset: 60,
//                     space: 5,

//                     hide_onleave: false,
//                     hide_onmobile: false,
//                     hide_under: 0,
//                     hide_over: 9999,
//                     hide_delay: 200,
//                     hide_delay_mobile: 1200

//                 }
//             },
//             responsiveLevels: [1024, 991, 767, 543],
//             visibilityLevels: [1024, 991, 767, 543],
//             gridwidth: [1600, 1600, 1600, 1600],
//             gridheight: [670, 670, 670, 670],
//             lazyType: "none",
//             // parallax: {
//             //     type: "scroll",
//             //     origo: "slidercenter",
//             //     speed: 50,
//             //     levels: [5000]
//             // },
//             shadow: 0,
//             spinner: "off",
//             stopLoop: "off",
//             shuffle: "off",
//             autoHeight: "off",
//             fullScreenAutoWidth: "off",
//             fullScreenAlignForce: "off",
//             fullScreenOffsetContainer: "",
//             fullScreenOffset: "",
//             disableProgressBar: "on",
//             hideThumbsOnMobile: "off",
//             hideSliderAtLimit: 0,
//             hideCaptionAtLimit: 0,
//             hideAllCaptionAtLilmit: 0,
//             debugMode: false,
//             fallbacks: {
//                 simplifyAll: "off",
//                 nextSlideOnWindowFocus: "off",
//                 disableFocusListener: false
//             }
//         });
//     }
// });

$(document).ready(function(){
	
	setTimeout(function() {
		var $head = $("#frame1").contents().find("head");  
		$head.append($("<link/>", 
			{ rel: "stylesheet", href: "/Data/Sites/1/skins/default/css/iframe.css", type: "text/css" }
		));     
	}, 1); 
	$("#tab-99").append($(".commentpanel"));
});
//# sourceMappingURL=main.js.map
