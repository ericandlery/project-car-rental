<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty login_ok}">
<c:redirect url="/member_function/login.jsp"></c:redirect>
</c:if>
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
/*         改這個地方 */
        #rent_zone{width:1400px;height:1000px;margin:auto;}
        #title{text-align:center;font-size:3em;font-weight:bold;}
        #date{background-color:#FFC9C9;border-radius:20px;width:400px;height:300px;margin-left:50px;display:inline-block;float:left;}
        .form{font-weight:bold;background:-webkit-radial-gradient(circle,#8282FF,#3030FF);
              border-radius:20px 20px 0px 0px;font-size:2em;color:white;}
        .input{background-color:#FFC559;display:inline-block;margin-top:50px;margin-left:50px;
               border:solid #878787 3px;font-size:18px;font-weight:bold;}
               .input2{background-color:#FFC559;display:inline-block;margin-top:50px;margin-left:50px;
               border:solid #878787 3px;font-size:18px;font-weight:bold;}
               .input3{background-color:#FFC559;display:inline-block;margin-top:50px;margin-left:50px;
               border:solid #878787 3px;font-size:18px;font-weight:bold;}
        #branch{background-color:#FFC9C9;border-radius:20px;width:400px;height:300px;margin-left:40px;display:inline-block;float:left;}
        #car{background-color:#FFC9C9;border-radius:20px;width:400px;height:300px;margin-left:40px;display:inline-block;float:left;}
        #reset{margin-left:50px;margin-top:50px;}
/*         改這個地方 */
    </style>
    <script>
    var start_date;
    var end_date;
    
    $(function(){
        $("#include_nav_no_login").load("/TestRentalMVC/header_footer/bro_nav_without_login.jsp");
        $("#include_nav_login").load("/TestRentalMVC/header_footer/bro_nav_with_login.jsp");
      });
///////////////改這裡    JavaScript///////////////
    var start_branch_name;
    var end_branch_name;
    var start_date;
    var end_date;
    var car_num;
    var wallet;

    $(document).ready(function () {
        $("#step2").prop("disabled", true);
        $("#step3").prop("disabled", true);
        $("#ds").prop("disabled",true);
		$("#de").prop("disabled",true);
		$("#select").prop("disabled",true);
		$("#pay").prop("disabled",true);
		
        
        $(".input#input_date").css("background-color", "black");
        $(".input#input_car").css("background-color", "black");
//         checkActive();
        allBranchs();
    });
////////////////先檢查使用者是否目前已經有訂單
// 	function checkActive(){
// 	$.get("checkActive.controller",function(data){
// 		var b=$.trim(data);
// 		if(b==="true"){
// 			alert("您目前已經有訂單了。提醒您，在訂單結束之前不可以再下單");
// 		}
// 		return;
// 	});
// }

//////////////AJAX取得所有據點(注意中文亂碼問題!!記得設定content-type)
    function allBranchs(){
    	$.getJSON("findAllBranchs.controller",function(data){
    		if(data.error!=null){
    			alert(data.error);
    		}else{
    			var branchTxt="<option selected disabled>請選擇</option>";
    			var l=data.length;
    			for(var i=0;i<l;i++){
    				branchTxt=branchTxt+"<option value='"+data[i].name+"'>"+data[i].name+"</option>";
    			}
    			$("#sbranch").html(branchTxt);
    			$("#ebranch").html(branchTxt);
    		}
    	});
    }
    
    
//////////選擇完據點後
    function nextStep1() {
		if(start_branch_name==undefined || end_branch_name==undefined){
			alert("請選擇借車和還車據點");
			return;
		}
	
		$("#sbranch").prop("disabled",true);
		$("#ebranch").prop("disabled",true);
		$("#step1").prop("disabled",true);
		$("#ds").prop("disabled",false);
		$("#de").prop("disabled",false);
	
        $("#step2").prop("disabled", false);
        $(".input#input_date").css("background-color", "aqua");
    }
//////////選擇完日期後查詢[可以租]的車輛，AJAX取得JSON格式資料(中文亂碼問題解決方法如上)
    function nextStep2() {
		if(start_date=="" || end_date==""){
			alert("請選擇借車及還車日期");
			return;
		}
	
// 		$("#ds").prop("disabled",true);
// 		$("#de").prop("disabled",true);
// 		$("#step2").prop("disabled",true);
		$("#select").prop("disabled",false);
		$("#pay").prop("disabled",false);
	
	
    	var selectTxt="<option selected disabled>請選擇</option>";
    	
		$.getJSON("findAvailableCars.controller",{start_branch_name:start_branch_name,end_branch_name:end_branch_name,
			start_date:start_date,end_date:end_date,car_state:"良好"},function(data){
				/////如果找不到車或輸入格式錯誤
				if(data.error!=null){
					$("#select").html(selectTxt);
					car_num=undefined;
// 					alert(data.error);
					alert("抱歉！目前該據點沒有車可以出租了");
					location.href="/TestRentalMVC/rent_car_function/make_reservation/reservation_form.jsp";
				}else{
					var jsonLength=data.length;
					for(var i=0;i<jsonLength;i++){
						selectTxt=selectTxt+"<option value='"+data[i].car_num+"'>"+data[i].car_num+" 單日價錢"+data[i].price_day+"</option>";
					}
					car_num=undefined;
					$("#select").html(selectTxt);
				}
				
		});
	
	
        $("#step3").prop("disabled", false);
        $(".input#input_car").css("background-color", "aqua");
    }
///////////////下訂單，交給Controller驗證資料
    function sendReservation() {
    	start_branch_name = $("select[name='start_branch_name']").val();
        end_branch_name = $("select[name='end_branch_name']").val();
        var sd=$("input[name='start_date']").val();
        var ed=$("input[name='end_date']").val();
        car_num = $("select[name='car_num']").val();
        if (start_branch_name == undefined || 
            end_branch_name == undefined ||
            sd == undefined ||
            ed == undefined ||
            car_num == undefined ||
            wallet==undefined) {
            alert("您還有項目沒填");
        } else {
            $.post("addNewOrder.controller",{start_branch_name:start_branch_name,
            	end_branch_name:end_branch_name,car_num:car_num,sd:sd,ed:ed,wallet:wallet},function(data){
            	if(data.error!=null){
            		alert(data.error);
            		
            	}else{
            		alert(data.ok);
            		location.href="/TestRentalMVC/index.jsp";
            	}
            },"json");
        }
    }

    function changeContext() {
        start_branch_name = $("select[name='start_branch_name']").val();
        end_branch_name = $("select[name='end_branch_name']").val();
        start_date = $("input[name='start_date']").val();
        end_date = $("input[name='end_date']").val();
        car_num = $("select[name='car_num']").val();
        wallet=$("select[name='payment']").val();
    }
    
    function reset(){
    	location.href="/TestRentalMVC/rent_car_function/make_reservation/reservation_form.jsp"
    }
///////////////改這裡/////////////////////////////
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
<!--                       改這裡 -->
		<div id="rent_zone">
                <p id="title">&nbsp;&nbsp;&nbsp;&nbsp;快速預約租車</p>
                <div id="branch">
                    <p class="form">選擇據點</p>
                    <form class="input" id="input_branch" action="#" method="get">
                        起點<select id="sbranch" name="start_branch_name" onblur="changeContext()"></select>
                        終點<select id="ebranch" name="end_branch_name" onblur="changeContext()"></select>
                        <input id="step1" type="button" value="下一步" onclick="nextStep1()"/>
                    </form>
                </div>
                <div id="date">
                    <p class="form">選擇日期</p>
                    <form class="input2" id="input_date" action="#" method="get">
                        借車日<input id="ds" type="date" name="start_date" onblur="changeContext()" /><br />	<!-- 記得改回來 -->
                        還車日<input id="de" type="date" name="end_date" onblur="changeContext()" /><br />		<!-- 記得改回來 -->
                        <input id="step2" type="button" value="下一步" onclick="nextStep2();"/>
                    </form>
                </div>
                <div id="car">
                    <p class="form">選擇車輛及付款方式</p>
                    <form class="input3" id="input_car" action="#" method="get">
                        <select id="select" name="car_num" onblur="changeContext()">
                            <option selected disabled>請選擇</option>
                        </select><br>
                        <select id="pay" name="payment" onblur="changeContext()">
                        	<option selected value="pay">現場付款</option>
                        	<option value="wallet">電子錢包</option>
                        </select>
                        <input id="step3" type="button" value="完成預約" onclick="sendReservation()"/>
                    </form><br>
                    <input id="reset" type="button" value="重新填寫" onclick="reset()">
                </div>         
            </div>
		
<!--                       改這裡 -->
        </article>
          </div>
         <%@ include file='/shared/footer.jsp'%> 
  
</body>
</html>