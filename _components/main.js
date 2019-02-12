// viết script, gọi function ở đây
$(document).ready(() => {


	slider_tab();

});

function slider_tab() {
	$('.murad-2019-2 .slider-for').not('.slick-initialized').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		dots: true,
		adaptiveHeight: true,
		fade: false,
		infinite: true,
		autoplay: false,
		asNavFor: '.slider-nav',
		responsive: [{
			breakpoint: 767,
			settings: {
				arrows: false,
			}
		}, ]
	});
	$('.murad-2019-2 .slider-nav').not('.slick-initialized').slick({
		autoplay: false,
		slidesToShow: 3,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: false,
		arrows: false,
		// prevArrow: $('.top-arrow'),
		// nextArrow: $('.bottom-arrow'),
		infinite: true,
		focusOnSelect: true
	})
};