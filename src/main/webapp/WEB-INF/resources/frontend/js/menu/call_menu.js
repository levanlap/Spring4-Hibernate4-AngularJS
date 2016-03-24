$(document).ready(function() {
	$(".fhmm").fitVids();
	//Fixed for mobile
	if($(document).width()>992){
		$("#menu_bar_fix").removeClass("menu-fixed-top-mobile");
	}else{
		$("#menu_bar_fix").addClass("menu-fixed-top-mobile");
	}
});
// Menu drop down effect
$('.dropdown-toggle').dropdownHover().dropdown();
$(document).on('click', '.fhmm .dropdown-menu', function(e) {
	e.stopPropagation()
})
$( document ).on( "resize", function() {
	/*$('.dropdown-toggle').dropdownHover().dropdown();*/
	if($(document).width()>991){
		$("#menu_bar_fix").removeClass("menu-fixed-top-mobile");
	}else{
		$("#menu_bar_fix").addClass("menu-fixed-top-mobile");
	}
});

$( document ).on( "scroll", function() {
	var scroll = $(this).scrollTop();
	if($(document).width()>=1024){
		$("#menu_bar_fix").removeClass("menu-fixed-top-mobile");
		if (scroll >= 400) {
			$("#menu_bar_fix").addClass("navbar-fixed-top menu-fixed-top");
		}else{
			$("#menu_bar_fix").removeClass("navbar-fixed-top menu-fixed-top");
		}
	}
	
});