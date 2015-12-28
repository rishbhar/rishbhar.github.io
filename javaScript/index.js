$(function () {

 $("#footer").load("footer.html");

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