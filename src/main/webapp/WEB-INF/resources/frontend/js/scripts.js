
$(document).ready(function() {
	/*MENU FIXED TOP ON SCROLL*/
	
	/*SHOW NEXT IMAGE*/
	$('.box_skitter_large').skitter({
		theme: 'default',
		dots: true, 
		preview: true,
		hideTools: true,
		enable_navigation_keys: false,
		with_animations: ['cubeJelly','cubeSpread','tube', 'cubeSize','cubeStop','cubeRandom'] ,
		numbers_align: 'center'
	});
	
	/*MENU FOR MOBILE*/
	 //Navigation Menu Slider
    $('#nav-expander').on('click',function(e){
  		e.preventDefault();
  		$('body').toggleClass('nav-expanded');
  	});
  	$('#nav-close').on('click',function(e){
  		e.preventDefault();
  		$('body').removeClass('nav-expanded');
  	});

  	// Initialize navgoco with default options
    $(".main-menu").navgoco({
        caret: '<span class="caret"></span>',
        accordion: false,
        openClass: 'open',
        save: true,
        cookie: {
            name: 'navgoco',
            expires: false,
            path: '/'
        },
        slide: {
            duration: 300,
            easing: 'swing'
        }
    });

    /*MENU RIGHT*/

    $('.profileRightMenu').hover(
            function () {
               $('#mini_profile_form').show();
               //$('.user').css('background','#049E9E');
            }, 
            function () {
               $('#mini_profile_form').hide();
               //$('.user').css('background','#000')
            }
         );
    
    $('.cartRightMenu').hover(
            function () {
               $('#mini_cart_form').show();
               //$('.cart').css('background','#049E9E');
            }, 
            function () {
               $('#mini_cart_form').hide();
               //$('.cart').css('background','#000')
            }
         );
    
    /*MENU TOP*/

   
    $(".userLoginTop").click(function(){
    	if($('#mini_login_form').hasClass("zoomOutLeft")){
    		$('#mini_login_form').removeClass("zoomOutLeft animated").addClass("zoomInLeft animated");
            $('#userLoginHover').removeClass("is-dis-active").addClass('is-active');
            $('#mini_login_form').removeClass("is-dis-visible").addClass('is-visible');
    	}else{
    		$('#mini_login_form').removeClass("zoomInLeft animated").addClass("zoomOutLeft animated");
            $('#userLoginHover').removeClass("is-active").addClass('is-dis-active');
            $('#mini_login_form').addClass('is-dis-visible');
    	}
    });
    
    $(".userRegisterTop").click(function(){
    	if($('#mini_register_form').hasClass("zoomOutDown")){
    		$('#mini_register_form').removeClass("zoomOutDown animated").addClass("zoomInDown animated");
    		 $('#userRegisterHover').removeClass("is-dis-active").addClass('is-active');
             $('#mini_register_form').removeClass("is-dis-visible").addClass('is-visible');
    	}else{
    		$('#mini_register_form').removeClass("zoomInDown animated").addClass("zoomOutDown animated");
    		 $('#userRegisterHover').removeClass("is-active").addClass('is-dis-active');
             $('#mini_register_form').addClass('is-dis-visible');
    	}
    });
    
  
    /*SEARCH */
    $("#searchProductBtn").click(function(){
		window.location.href="${cp}/tim-kiem-san-pham-" + $("#searchText").val()+".html";
	});
	$("#searchText").keypress(function(e){
		if(e.which == 13) {
			$("#searchProductBtn").click();
	    }
	});
	
	 $('.top_best_catalog').hover(
	            function () {
	               $(this).addClass('hovers');
	               //$('.cart').css('background','#049E9E');
	            }, 
	            function () {
	            	  $(this).removeClass('hovers');
	               //$('.cart').css('background','#000')
	            }
	         );
});