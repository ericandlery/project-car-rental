<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>

<script src="http://cdn.staticfile.org/moment.js/2.2.1/moment.min.js"></script>
<link rel="stylesheet" href="http://dbushell.github.com/Pikaday/css/pikaday.css">
<script src="http://dbushell.github.com/Pikaday/pikaday.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/TestRentalMVC/resources/js/jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	
		alert("12");
		$( "#dialog" ).dialog();



	var i18n = { // 本地化
		previousMonth	: '上个月',
		nextMonth		: '下个月',
		months			: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
		weekdays		: ['周日','周一','周二','周三','周四','周五','周六'],
		weekdaysShort	: ['日','一','二','三','四','五','六']
	}

	var datepicker = new Pikaday({ 
		field:		jQuery('#datepicker')[0],  
		minDate:	new Date('2000-01-01'), 
		maxDate:	new Date('2020-12-31'), 
		yearRange:	[2000,2020],
		i18n: 		i18n,
		onSelect: 	function() {
			var date = document.createTextNode(this.getMoment().format('YYYY-MM-DD') + ' '); //生成的时间格式化成 2013-09-25
			$('#datepicker').appendChild(date);
		}
	});

});
</script>
<script >
function show_confirm()
{
var r=confirm("是否確認刪除?");
if (r==true)
  {
	alert(document.getElementById("checkyesorno").value = "yes");
	location.href="controller";
  }
else
  {
	alert(document.getElementById("checkyesorno").value = "no");
	return;
  }
}

function subsub(e){
	var r=confirm("test");
	if(r==true){
		return;
	}else{
		e.preventDefault();
		return;
	}
}


</script>
</head>
<body>
<input id="checkyesorno" type="hidden" value="" />

<input type="button" onclick="show_confirm()">
 
Date2: <input type="text" id="datepicker">

<a href="test.controller">Test</a>

<form action="3423423">

<input type="submit" onclick="subsub(event)">

</form>

<div id="dialog" title="Basic dialog" style="display:none;">
  		<p>111</p>
	</div>
	
	<iframe width="854" height="480" src="https://www.youtube.com/watch?v=gj5yzlP61Bs" frameborder="0"  allowfullscreen></iframe></div>
    
</body>
</html>