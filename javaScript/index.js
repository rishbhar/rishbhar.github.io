$(function () {




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