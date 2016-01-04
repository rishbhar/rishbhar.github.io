$(function () {






//jQuery to collapse the navbar on scroll
/*$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});*/

//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top-90/*70 added by Rishabh*/
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

//nav bar shrink
$(window).scroll(function() {
  if ($(document).scrollTop() > 100) {
    $('nav').addClass('shrink');
    $('#navLinksBar').addClass('shrinkNavLinkBar');
    $('#logoImage').attr("src","LOGO_Block.png");
      $('#collapseButton').css("margin-top","20px");
   
  } else {
    $('nav').removeClass('shrink');
    $('#navLinksBar').removeClass('shrinkNavLinkBar');
    $('#logoImage').attr("src","LOGO_Block.jpg");
    $('#collapseButton').css("margin-top","48px");
  }
});




$('.carousel-control.left').click(function() {
  $('#myCarousel').carousel('prev');
});

$('.carousel-control.right').click(function() {
  $('#myCarousel').carousel('next');
});


$('a[data-slide="prev"]').click(function() {
  $('#myCarousel').carousel('prev');
});

$('a[data-slide="next"]').click(function() {
  $('#myCarousel').carousel('next');
});


$("[id^='workExp']").click(
	function()
	{
		//alert(this.id.search("ContentBlock"));
		if(-1!=(this.id.search("ContentBlock")))
			return false;
		var currentPosition = $(window).scrollTop();
		//alert("currentPosition"+currentPosition);
		var secondNavBarPosition = $('#navLinks').offset().top;
		//alert("secondNavBarPosition"+secondNavBarPosition);

		//$('[id^="ContentBlock"]').css("display","none");
		$("[id*=ContentBlock]").css("display","none");
		var id=this.id+'ContentBlock';
		//alert(id);
		$('#'+id).css("display","block");
		if(currentPosition > secondNavBarPosition)
		$(window).scrollTop($('#navLinks').offset().top);
		
	});

});