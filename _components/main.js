// viết script, gọi function ở đây
$(document).ready(() => {
	var no_element = $('.murad-2019-2 ul li').length
	var tab_el = $('.murad-2019-2 ul li a')
	$('.murad-2019-2 .nav .nav-link').on('click', function () {
		$(this).toggleClass('active')
		$(this).parent().siblings().find('a').removeClass('active')
		var pos = $('.murad-2019-2 ul li a.active').parent().index()
		
		$('.murad-2019-2-2 .block_btn a').eq(pos ).siblings().removeClass('active')
		$('.murad-2019-2-2 .block_btn a').eq(pos ).toggleClass('active')
		$('.murad-2019-2-2').find($(this).attr('href')).fadeIn()
		$('.murad-2019-2-2').find($(this).attr('href')).siblings().hide()

	})
	$('.murad-2019-2-2 .block_btn .btn-stt').on('click', function () {
		$(this).toggleClass('active')
		$(this).siblings().removeClass('active')
		var pos = $('.murad-2019-2-2 .block_btn  a.active').index()
		
		tab_el.eq(pos ).addClass('active')
		tab_el.eq(pos ).parent().siblings().find('a').removeClass('active')
		$('.murad-2019-2-2').find($(this).attr('href')).fadeIn()
		$('.murad-2019-2-2').find($(this).attr('href')).siblings().hide()

	})



	$('.murad-2019-2-2 .btn-next').click(function () {
		var position = $('.murad-2019-2 ul li a.active').parent().index()
		if (position >= no_element-1) {
			position = -1
		}
		tab_el.eq(position + 1).addClass('active')
		tab_el.eq(position + 1).parent().siblings().find('a').removeClass('active')
		$('.murad-2019-2-2 .block_btn a').eq(position + 1).siblings().removeClass('active')
		$('.murad-2019-2-2 .block_btn a').eq(position + 1).toggleClass('active')
		$('.murad-2019-2-2').find(tab_el.eq(position + 1).attr('href')).fadeIn()
		$('.murad-2019-2-2').find(tab_el.eq(position + 1).attr('href')).siblings().hide()

	})
	$('.murad-2019-2-2 .btn-prev').click(function () {
		var position = $('.murad-2019-2 ul li a.active').parent().index()
		if (position == 0) {
			position = no_element
		}
		tab_el.eq(position - 1).addClass('active')
		tab_el.eq(position - 1).parent().siblings().find('a').removeClass('active')
		$('.murad-2019-2-2 .block_btn a').eq(position - 1).siblings().removeClass('active')
		$('.murad-2019-2-2 .block_btn a').eq(position - 1).toggleClass('active')
		$('.murad-2019-2-2').find(tab_el.eq(position - 1).attr('href')).fadeIn()
		$('.murad-2019-2-2').find(tab_el.eq(position - 1).attr('href')).siblings().hide()

	})



});
