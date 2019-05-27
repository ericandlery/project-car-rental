<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Jeams租車</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<script src="/TestRentalMVC/assets/js/jquery.min.js"></script> 
<script src="/TestRentalMVC/assets/js/bootstrap.min.js"></script> 
<script src="/TestRentalMVC/assets/js/wow.min.js"></script> 
<script src="/TestRentalMVC/assets/js/slick.min.js"></script> 
<script src="/TestRentalMVC/assets/js/custom.js"></script>
<!-- <link rel="stylesheet" -->
<!--  	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --> 
<!-- <script -->
<!-- 	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>  -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css">--> 
<style>
.photocss {
	width: 400px;
	height: 200px;
}

.map {
	height: 200px;
	width: 200px;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css"> 
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
//     	JavaScript改這個地方///////////////////////////////////////
    $(document).ready( function () {    	
        $('#branchserch_table').DataTable();
        
        
    	
    } );
	
//     function testpic(){
//     	alert("000000");
//     	$("#dialog").dialog();
	
//     }
    
//     function omg111(){
//     	alert("omg111");
//     	$("#dialog").dialog();
//     	alert("omg112");
//     }



		
// 	function testpic(name){
		
// 		$.getJSON("branchsearchSSS.controller?name="+name,function(data){
	    	
		 	
			 
// 	    	var txt="<tr><th>branch_name</th><th>car_state</th></tr>";
	    	
// 	    	if(data.length!=0){
// 	    		for(var i=0;i<data.length;i++){
// 	    			alert("branch_name="+data[i].branch_name)
// 	    			alert("car_state="+data[i].car_state)
// 	    			txt=txt+"<tr><td>"+data[i].branch_name+"</td>"+"<td>"+data[i].car_state+"</td></tr>"
// 	    		}
	    		
// 	    		$("#branchsearchSSS").html(txt);
// 	    	}else{
// 	    		txt=txt+"<option disabled>請聯絡網站人員</option>"
// 	    		$("#branchsearchSSS").html(txt);
// 	    	}
	    	
// 	    	$("#dialog").dialog();


// 	    });
		
		
		
		
// 	}
// 		JavaScript////////////////////////////////////////////////
    
//      $( function() {
//     $( "#dialog" ).dialog();
//   } );
    </script>
</head>
<body>

   <div>
        <c:choose>
        <c:when test="${empty login_ok}">
        <nav id="include_nav_no_login">
        </nav>
        </c:when>
        <c:otherwise>
        <nav id="include_nav_login">
        </nav>
        </c:otherwise>
        </c:choose>
        <article>
<!--                       HTML改這裡 ////////////////////-->
		
		
<!--                       HTML/////////////////////////// -->
        </article>
     
    </div>
<!------------------------  GoogleMap ----------------------->

	

	<script>
	   
		function initMap() {
				
				var i=document.getElementById("size").value;
				
				for(var n=0;n<=i-1;n++){

						var mp=$(".map").eq(n).attr("id");//取出所有div的class=map的元素，eq(0)=第一個，attr=抓取id值
			 			var map = new google.maps.Map(document.getElementById(mp), {
							zoom : 15,
						});
						
						var geocoder = new google.maps.Geocoder();
							geocodeAddress(geocoder, map);
						

				}
// 		    var map = new google.maps.Map(document.getElementById('1'), {
// 				zoom : 12,
// 			});
		    
// 			var geocoder = new google.maps.Geocoder();
// 	            geocodeAddress(geocoder, map);
	        
// 			var map = new google.maps.Map(document.getElementById('2'), {
// 				zoom : 12,
// 			});
// 			var geocoder = new google.maps.Geocoder();
// 			geocodeAddress(geocoder, map);
// 			var map = new google.maps.Map(document.getElementById('3'), {
// 				zoom : 12,
// 			});
// 			var geocoder = new google.maps.Geocoder();
// 			geocodeAddress(geocoder, map);
// 			var map = new google.maps.Map(document.getElementById('4'), {
// 				zoom : 12,
// 			});
// 			var geocoder = new google.maps.Geocoder();
// 			geocodeAddress(geocoder, map);
// 			var map = new google.maps.Map(document.getElementById('5'), {
// 				zoom : 12,
// 			});
// 			var geocoder = new google.maps.Geocoder();
// 			geocodeAddress(geocoder, map);
// 			var map = new google.maps.Map(document.getElementById('6'), {
// 				zoom : 12,
// 			});
// 			var geocoder = new google.maps.Geocoder();
// 			geocodeAddress(geocoder, map);
		}
		
		</script>

   <script>
		function geocodeAddress(geocoder, resultsMap) {
			
		var address = document.getElementById('address').value;

// 		alert(address)
		document.getElementById('address').removeAttribute("id");
		
		
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
	</script>
    <script  defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1NIJ4lHxca0Xj-L32quFIB-A4eKvpRsE&callback=initMap">
    </script>
<!-- ----------------------------------------------- -->
 
<div class="container">

<input id="size" style="display:none" value="${size}">
	<form style="margin-left:800px;margin-top:20px;margin-bottom:10px "action="selecetLocation02.controller" method="post">
			              <span style="color:red;margin-left:20px;margin-right:10px ">篩選據點:</span><select  name="selectlocation">
			               <option value="all"${param.selectlocation=='all'?'selected':''}>全部</option>
			               <option value="north"${param.selectlocation=='north'?'selected':''}>北</option>
			               <option value="middle"${param.selectlocation=='middle'?'selected':''}>中</option>
			               <option value="south"${param.selectlocation=='south'?'selected':''}>南</option>     
			             </select>
			                <input type="submit" value="篩選"class="buttonmodify" style="color: black">             
			    </form>
	<form id='form1' name='form1' action="searchBranch.controller" method="post">
        
		<table id="branchserch_table" align="center" class="display" height="800px" width="800px">
		  
			<div><h1 align="center">據點查詢</h1></div>
			  <thead style="background-color:red">
				<tr >
					<th>name</th>
					<th>address</th>
					<th>telephone</th>
					<th>photo</th>
					<th>map</th>
				</tr>
			  </thead>
			
			
                <tbody>
                <c:forEach var="Search" items="${Search}">
			    <input id='address' type="hidden" value="${Search.address}">
			    <input id='location' type="hidden" value="${Search.location}">
			    <tr>
				<td width="80px" align="center">${Search.name}</td>
				<td width="80px" align="center">${Search.address}</td>
				<td width="80px" align="center">${Search.tele}</td>
				<td width="400px" align="center">
				   <img alt="尚未上傳圖片" src="/TestRentalMVC/resources/Branch_photo/${Search.photo}" height="200px" width="300px" >
				   <div id="dialog"></div>
				</td>
				<td>
				
				<div id='${Search.address}' class="map"></div>					
                </td>
                </tr>
                </c:forEach>
                </tbody>
			

		</table>
<!--         <div style="float:left"> -->
<!-- 		  <input style="height:100px;width:100px;margin: 20px"  type="submit" value="查詢" > -->
<!-- 		</div> -->
	</form>
	</div>
<script>
// window.location.replace('http://localhost:8080/TestRentalMVC/branch_zone/searchBranch.controller');
// window.location.href('http://localhost:8080/TestRentalMVC/branch_zone/searchBranch.controller');
// $(document).ready(function(){
// 	alert("12");
// });
// setTimeout("document.form1.submit() ",500)

</script>

 <%@ include file='/shared/footer.jsp'%> 
</body>
</html>