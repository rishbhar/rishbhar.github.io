$(function () {



$("[id^='workExp']").click(
	function()
	{
		alert(this.id);

		$("[id^='workExp'+'Content']").css("display","none");

		var id=this.id+'Content';
		alert(id);
		$('#'+id).css("display","block");


	});


$("[id^='workExpContent']").click(
	function()
	{
		
		if(this.id="workExpContent1")
		{
			var id=this.id+'';
			alert(id);
		}


	});

	

});