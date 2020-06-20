$(document).ready(function() {
	//選單搜尋列顯示隱藏控制
	$(".search-icon").on('click', function() {
		$(".header-bottom-search").slideToggle();
		$(".first-currencies").css("display", "none");
		$(".first-languages").css("display", "none");
	});
});

$(function($){
	$(document)
	.ajaxStart(function(){
		NProgress.start();
  }) //don't add semicolon(";")
	.ajaxStop(function(){
		NProgress.done();
	});



	//navbar btn control
//	$('#menberlogin').on('click',function(){
//		var url = $(this).attr('href');
//		$('#main').load(url + ' #main >*');
//		return false;
//	});

	$('.nav-link').on('click',function(){
		var url = $(this).attr('href');
		$('#main').load(url + ' #main >*');
		return false;
	});


});

// login catch element ,waiting for test
// $('#submitBtn').click(function(){
// 	alert($('#account').val());
// 	alert($('#password').val());
// });