<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty login_ok}">
<c:redirect url="/member_function/login.jsp"></c:redirect>
</c:if>
<%-- <c:remove var="staff_login_ok" scope="session"/> --%>
<%-- <c:remove var="manager_login_ok" scope="session" />			<!-- 強制登出管理者和門市人員 --> --%>
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
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/header_footer.css"> -->
    <style>
/*         CSS改這個地方//////////////////////////// */
        .top{height:1150px;}
        #title{text-align: center;font-size: 3em;font-weight:bold;color:#636363;font-family:標楷體;}
        #body {
        height:1200px;width:1170px;overflow:auto;margin-left:300px;margin-bottom:-30px
/*             background-image:URL(/TestRentalMVC/images/bgd1200x1170.jpg); */
/*             height: 1000px; */
/*             margin: auto; */
/*             width: 1170px; */
/*             margin: auto; */
/*             overflow: auto; */
        }
        

        #body div {
            display: inline-block;
            margin: 25px;
            overflow: auto;
        }

        .box_title {
            text-align: center;
            background:-webkit-radial-gradient(circle,#8282FF,#3030FF);
            font-family:標楷體;
            font-size: 2em;
            color:white;
            
        }
        
        #type {
            border-radius:20px;
            width: 250px;
            height: 250px;
            background-color:#FFC9C9;
            text-align: center;
        }
        
        #location {
            border-radius:20px;
            width: 250px;
            height: 250px;
            background-color:#FFC9C9;
            text-align: center;
        }

        #price {
            border-radius:20px;
            width: 350px;
            height: 250px;
            background-color:#FFC9C9;
            text-align: center;
        }

        #car {
            border-radius:20px;
            width: 250px;
            height: 250px;
            background-color:#FFC9C9;
            text-align: center;
        }

        #accept {
            background:-webkit-radial-gradient(circle,#E4BFFF,#990DFF);
            font-size: 3em;
            padding: 20px;
            float: left;
            margin-top: 50px;
            margin-left:25px;
            cursor: pointer;
        }

        #payment {
            background: rgba(100%,100%,100%,0.5);
            width: 900px;
            height: 100px;
            float: left;
            margin-left: 25px;
            font-size: 3em;
        }

        #r1, #r2 {
            margin: 10px;
            width: 1.5em;
            height: 1.5em;
        }

        #wallet {
            font-size: 22px;
            font-weight:bold;
        }

        #test_price {
        margin-top:-60px;
        }

        #priceTxt {
            font-family:新細明體;
            font-size:18px;
            color: red;
        }

        .errors {
            color: red;
        }
        
        
/*         CSS///////////// ///////////////////////*/
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJosg6BMG4lI0mlqGkgrDKT57jgVGx3uE"
            async defer></script>		<!-- Google Map API -->
    <script>
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
//     	JavaScript改這個地方///////////////////////////////////////
var select_type;
	var category="普通房車駕照";
	var seatCount;
	var finalDistance;
	var car_state="良好";

$(document).ready(function(){
	/////////////////顯示出所有車種裡有的座位數
	$.getJSON("getAllSeat.controller",{category:category},function(data){
		var seatCount="<option selected disabled >請選擇</option>";
		for(var i=0;i<data.length;i++){
			seatCount=seatCount+"<option value='"+data[i]+"'>"+data[i]+"</option>"
		}
		$("#seat").html(seatCount);
	});
	////////////顯示會員餘額
	$.get("showWallet.controller",function(data){
		$("#wallet").html("您的餘額："+data+"元");
	});

	///////////預設搜尋良好(可提供)的車輛
	$("#car_state").val(car_state);

	///////////顯示餘額不足的訊息
	if($("#hiddenWallet").text().length>0){
		alert($("#hiddenWallet").text());
	}
	//////////若會員已經有訂單在身，則不讓他下
	if($("#hiddenOrder").text().length>0){
	alert($("#hiddenOrder").text());
}

});

//////////////根據使用者選擇送機接機來決定下一個欄位顯示什麼
function selectType(){
	var start="";
	var end="";
	select_type=$("#select_type").val();
	$.getJSON("selectType.controller",function(data){
		if(select_type=="接機"){
			start=start+"<option selected disabled>請選擇</option>"
			for(var i=0;i<data.length;i++){
				start=start+"<option value="+data[i].id+">"+data[i].name+"</option>";
			}
			$("#start").html(start);

			end=end+"<option value='notHere'>請填寫在地址欄</option>";
			$("#end").html(end);

		}else if(select_type=="送機"){
			end=end+"<option selected disabled>請選擇</option>";
			for(var i=0;i<data.length;i++){
				end=end+"<option value="+data[i].id+">"+data[i].name+"</option>";
			}
			$("#end").html(end);

			start=start+"<option value='notHere'>請填寫在地址欄</option>";
			$("#start").html(start);
		}
	});
}
/////////////////////////////////////
//////////////根據座位數選擇車型
function selectSeat(){
	var model="<option selected disabled >請選擇</option>"
	seatCount=$("#seat").val();

	$.getJSON("getAllModelsBySeat.controller",{seatCount:seatCount,category:category},function(data){
		for(var i=0;i<data.length;i++){
			model=model+"<option disabled>以下是"+data[i][0].brand+"車款</option>";
			for(var j=0;j<data[i].length;j++){
				model=model+"<option value='"+data[i][j].id+"'>"+data[i][0].brand+" "+data[i][j].name+"</option>"
			}
		}
		$("#model").html(model);
	});

}
////////////////////////////////////
//////////////驗證、送出訂單
function acceptOrder(event){
	event.preventDefault();
	var r=confirm("確定送出訂單嗎？");
	if(r==false){
		return;
	}


	var origin;
	var destination;
	var modelName=$("#model option:selected").text();
	var modelId=$("#model").val();
	var temp;
	var testPrice;

	if($("#start").val()=='notHere'){
		origin=$("#address").val();
		destination=$("#end option:selected").text();
	}else if($("#end").val()=='notHere'){
		origin=$("#start option:selected").text();
		destination=$("#address").val();
	}
	/////////判斷出發點和目的地
	if(origin==undefined || origin=="請選擇" || origin.length==0 ||
			destination==undefined || destination=="請選擇" || destination.length==0){
		alert("請先確認出發點和目的地，以方便我們為您處理訂單");
		return;
	}
	/////////判斷車型
	if(modelId==null){
		alert("請先選擇車款");
		return;
	}

	calculateDistance(origin,destination);
	function calculateDistance(origin, destination) {

	    var service = new google.maps.DistanceMatrixService();
	    service.getDistanceMatrix(
	    {
	        origins: [origin],
	        destinations: [destination],
	      travelMode: google.maps.TravelMode.DRIVING,
	      unitSystem: google.maps.UnitSystem.METRIC,
	      avoidHighways: false,
	      avoidTolls: false
	    }, callback);
	  }

	function callback(response, status) {
	    if (status != google.maps.DistanceMatrixStatus.OK) {
	    	alert("Google Distance Matrix服務異常");
	    } else {
	      var ori = response.originAddresses[0];
	      var des = response.destinationAddresses[0];
	      if (response.rows[0].elements[0].status === "ZERO_RESULTS") {
	        alert("很抱歉，這距離太遠了，您還是搭飛機去吧！");
	      } else {
	        var distance = response.rows[0].elements[0].distance;
	        var distance_value = distance.value;
	        var distance_text = distance.text;
	        var miles = distance_text.substring(0, distance_text.length - 3);
	        finalDistance=Math.round(distance_value/1000);

// 	        alert(finalDistance);
	        $("#distance").val(finalDistance);
// 	        alert($("#distance").val());

	        /////////////Delay幾秒中，避免Google來不及抓
	        $("#test_price").html("試算中，請稍候");
	        $.get("testPrice.controller",{modelId:modelId,car_state:car_state},function(data){
	        	///////////將ajax抓到的資料放進現在網頁的變數
	        	$("#tempPrice").val(data);
	        });
	        setTimeout(function(){
	        	testPrice=$("#tempPrice").val();
// 	        	alert(Number(testPrice));	轉型成數字
	        	setTimeout(showTestPrice,500);
	        },500);
		/////////////要延遲一下，否則有來不及抓資料的風險
	      }
	    }
	    /////////////顯示出試算的價格
	    function showTestPrice(){
	    	if($("#tempPrice").val()=="error"){
	    		$("#test_price").html("目前無法提供該車款，請選擇其它車款");
	    	}else{
// 	    		$("#test_price").html("您的車款是["+modelName+"]<br>從["+origin+"]到["+destination+"]的距離約為"+finalDistance+"公里"+
// 	    				"<br>價格約為"+(Math.round(((Number(testPrice)/2)+Number(finalDistance))))+"元");
				$("#test_price").html("");
	    		$("#form").submit();
	    	}
	    }
	}

}
/////////////////////////////////
///////////試算價格
function testPrice(){

	var origin;
	var destination;
	var modelName=$("#model option:selected").text();
	var modelId=$("#model").val();
	var temp;
	var testPrice;

	if($("#start").val()=='notHere'){
		origin=$("#address").val();
		destination=$("#end option:selected").text();
	}else if($("#end").val()=='notHere'){
		origin=$("#start option:selected").text();
		destination=$("#address").val();
	}
	/////////判斷出發點和目的地
	if(origin==undefined || origin=="請選擇" || origin.length==0 ||
			destination==undefined || destination=="請選擇" || destination.length==0){
		alert("請先確認出發點和目的地，以方便我們為您試算價格");
		return;
	}
	/////////判斷車型
	if(modelId==null){
		alert("請先選擇車款");
		return;
	}

	calculateDistance(origin,destination);
	function calculateDistance(origin, destination) {

	    var service = new google.maps.DistanceMatrixService();
	    service.getDistanceMatrix(
	    {
	        origins: [origin],
	        destinations: [destination],
	      travelMode: google.maps.TravelMode.DRIVING,
	      unitSystem: google.maps.UnitSystem.METRIC,
	      avoidHighways: false,
	      avoidTolls: false
	    }, callback);
	  }

	function callback(response, status) {
	    if (status != google.maps.DistanceMatrixStatus.OK) {
	    	alert("Google Distance Matrix服務異常");
	    } else {
	      var ori = response.originAddresses[0];
	      var des = response.destinationAddresses[0];
	      if (response.rows[0].elements[0].status === "ZERO_RESULTS") {
	        alert("很抱歉，這距離太遠了，您還是搭飛機去吧！");
	      } else {
	        var distance = response.rows[0].elements[0].distance;
	        var distance_value = distance.value;
	        var distance_text = distance.text;
	        var miles = distance_text.substring(0, distance_text.length - 3);
	        finalDistance=Math.round(distance_value/1000);
	        /////////////Delay幾秒中，避免Google來不及抓
	        $("#test_price").html("試算中，請稍候");
	        $.get("testPrice.controller",{modelId:modelId,car_state:car_state},function(data){
	        	///////////將ajax抓到的資料放進現在網頁的變數
	        	$("#tempPrice").val(data);
	        });
	        setTimeout(function(){
	        	testPrice=$("#tempPrice").val();
// 	        	alert(Number(testPrice));	轉型成數字
	        	setTimeout(showTestPrice,500);
	        },500);
		/////////////要延遲一下，否則有來不及抓資料的風險
	      }
	    }
	    /////////////顯示出試算的價格
	    function showTestPrice(){
	    	if($("#tempPrice").val()=="error"){
	    		$("#test_price").html("目前無法提供該車款，請選擇其它車款");
	    	}else{
	    		$("#test_price").html("您的車款是["+modelName+"]<br>從["+origin+"]到["+destination+"]的距離約為"+finalDistance+"公里"+
	    				"<br>價格約為"+(Math.round((Number(testPrice)+Number(finalDistance))))+"元");
	    	}
	    }
	}

}


// 		JavaScript////////////////////////////////////////////////
    </script>
</head>
<body>
    <div class="top">
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
		<form id="form" action="acceptPickupOrder.controller" method="post">
                <div id="body">
                    <h1 id="title">機場接送</h1>
                    <div id="type">
                        <p class="box_title">接機還是送機？</p>
                        <select id="select_type" name="select_type" onchange="selectType()">
                            <option disabled selected>請選擇</option>
                            <option value="接機">接機</option>
                            <option value="送機">送機</option>
                        </select><br><span class="errors">${errors.select_type}</span>
                    </div>
                    <div id="location">
                        <p class="box_title">選擇出發/抵達位置</p>
                        出發點
                        <select id="start" name="start">
                            <option selected disabled>請選擇</option>
                        </select><br /><span class="errors">${errors.start}</span><br />
                        目的地
                        <select id="end" name="end">
                            <option selected disabled>請選擇</option>
                        </select><br /><span class="errors">${errors.end}</span><br />
                        地址欄<input id="address" type="text" name="address" value="台北" /><br><span class="errors">${errors.address}</span>			<!-- 記得改回來 -->
                    </div>
                    <div id="location">
                        <p class="box_title">選擇日期時間</p>
                        <!-- 記得改回來 -->                        	出發日期(格式=>(西洋)年-月-日)<br><input id="work_day" type="date" name="work_day" ><br /><span class="errors">${errors.work_day}${date_error}</span><br />
                        <!-- 記得改回來 -->                      	 	出發時間(格式=>時:分)<br><input id="work_time" type="time" name="work_time"  /><br><span class="errors">${errors.work_time}</span>
                    </div>
                    <div id="car">
                        <p class="box_title">選擇車型</p>
                        選擇座位數
                        <select id="seat" name="seat" onchange="selectSeat()">
                            <option selected disabled>請選擇</option>
                        </select><br /><br />
                        選擇車型
                        <select id="model" name="modelId">
                            <option selected disabled>請選擇</option>
                        </select><br /><span class="errors">${errors.modelId}${errors.no_driver}</span><br />
                        <!--                         <input type="submit" value="送出訂單"> -->
                    </div>
                    <div id="price">
                        <p class="box_title">價格試算</p>
                        <div><input type="button" value="填寫好後請按此試算價格" onclick="testPrice()"></div><br><br><br>
                        <p id="test_price"></p>
                        <div id="priceTxt">試算價格僅供參考，實際價格會依里程及配給車輛做調整。請以訂單上的價格為主。</div>
                    </div>
                    <span id="payment">
                        <label><input id="r1" type="radio" name="payment" checked>現場付款</label>
                        <label><input id="r2" type="radio" name="payment" value="wallet">使用電子錢包</label>&nbsp;&nbsp;&nbsp;<span id="wallet">您的餘額：元</span>
                        <br><span class="errors">${errors.payment}</span>
                    </span>
                    <button id="accept" type="submit" onclick="acceptOrder(event)"><span>填寫完畢 確認送出</span></button>

                </div>
                <%--                 ${errors.number} --%>
                <input style="display:none" id="car_state" name="car_state">
                <input style="display:none" id="distance" name="km">
            </form>
            <input style="display:none" id="tempPrice">
            <p id="hiddenWallet" style="display:none">${errors.wallet}</p>
            <p id="hiddenOrder" style="display:none">${order}</p>
		
<!--                       HTML/////////////////////////// -->
        </article>
        
    </div>
<%-- <h3>path=<%=application.getRealPath("/")%></h3>     --%>
    <%@ include file='/shared/footer.jsp'%> 
    
</body>
</html>