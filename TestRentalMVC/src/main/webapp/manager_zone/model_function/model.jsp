<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>租車頁面</title>
<link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script src="/TestRentalMVC/resources/js/jquery.jqtransform.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/header_footer.css">
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">
<style>
/*         改這個地方 */
.buttonmodify {
    background-color: #77DDFF;
    border: none;
    color: black;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 10px;
}

.buttonmodify:hover {
    background-color: #CCEEFF; 
    color: white;
}
.buttondelete {
    background-color: #FFFFBB;
    border: none;
    color: black;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 12px;
}

.buttondelete:hover {
    background-color: #FF0000; 
    color: white;
}

.buttonedit {
    background-color: #FFFFBB;
    border: none;
    color: black;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 12px;
}

.buttonedit:hover {
    background-color: #D1BBFF; 
    color: white;
}   

fieldset {
    margin: 1em 150px 10px 150px;
    padding: 4px;
    border: 2px solid #CCC;

}
legend {
    margin-left: 1em;
    color: #009;
    font-weight: bold;

}

   #menu{background-color:Highlight;width:200px;height:100px;float:right;text-align:center;padding-top:20px;font-size:2em;}     
/*         改這個地方 */
</style>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script>
	$(function() {
		$("#include_nav_no_login").load(
				"/TestRentalMVC/header_footer/nav_without_login.jsp");
		$("#include_nav_login").load(
				"/TestRentalMVC/header_footer/nav_with_login.jsp");
	});
	function subsub(event){
		var r=confirm("確認是否刪除?");
		if(r==true){
			return;
		}else{
			event.preventDefault();
			return;
		}
	}
	
    $(document).ready( function () {
        $('#model_table').DataTable();//table
     	  $("#input1").focus(function(){$(this).css("background-color","#FFFFCC");})
     	   .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input2").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input3").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input4").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input5").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input6").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});
     	  $("#input7").focus(function(){$(this).css("background-color","#FFFFCC");})
           .blur(function(){$(this).css("background-color","#FFFFFF")});

    } );
    
    
//  $.getJSON("searchBranchSS.controller",function(data){
    	
//     	var txt="<option value='noSelect'selected disabled>選擇據點</option>";
    	
//     	if(data.length!=0){
//     		for(var i=0;i<data.length;i++){
//     			txt=txt+"<option value='"+data[i].name+"'>"+data[i].name+"</option>"
//     		}
//     		$("#searchBranchSS").html(txt);
//     	}else{
//     		txt=txt+"<option disabled>請聯絡網站人員</option>"
//     		$("#searchBranchSS").html(txt);
//     	}


//     });
   
</script>
</head>
<body>
	<div>
	<header>
			車型列表
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
        <nav></nav>
		<article>
			<div class="container bg-primary">
				<span>${error_model}${error_category}${error_insert}${error_show}</span>
				<div class="row" style="align:center;width:1350px;background-color:#B088FF">
					<c:if test="${not empty select}">
						<h2 align="center">所有車型清單</h2>
						<form action="modelC.controller" method="POST" style="marker-offset:10px" enctype="multipart/form-data" >
							    <fieldset>
							    <h2 align="center" style="margin-bottom:1em" >新增/更新資料</h2>    						
						<input type="hidden" name="id" style="width:60px;color:black" value="${modelaa.id}">
						名稱:<input id="input1" type="text" name="name" style="width:60px;color:black" value="${modelaa.name}">
<!-- 						據點: -->
<!-- 						     <select name="brand" id="searchBranchSS" style="color:black"> -->
                	        
<!--                 	         </select> -->
						
						廠牌:<input id="input2" type="text" name="brand" style="width:60px;color:black" value="${modelaa.brand}">
						CC數:<input id="input3" type="text" name="cc" maxlength="4" style="width:40px;color:black"value="${modelaa.cc}">
						長:<input id="input4" type="text" name="size_l" maxlength="4" style="width:40px;color:black" value="${modelaa.size_l}">
						寬:<input id="input5" type="text" name="size_w" maxlength="4" style="width:40px;color:black" value="${modelaa.size_w}">
						高:<input id="input6" type="text" name="size_h" maxlength="4" style="width:40px;color:black" value="${modelaa.size_h}">
						可乘人數:<select id="seat" name="seat" style="color:black">
								<option value="2" ${param.seat=='2'?'selected':''} >2</option>
						        <option selected="selected" value="5" ${param.seat=='5'?'selected':''} >5</option>
						        <option value="7" ${param.seat=='7'?'selected':''} >7</option>
						      </select>
<%-- 						可乘人數:<input type="text" name="seat" maxlength="1" style="width:25px;color:black" value="${modelaa.seat}"> --%>
						可容納行李(大):<select id="box_big" name="box_big" style="color:black">
						             <option value="1" ${param.box_big=='1'?'selected':''} >1</option>
						             <option value="2" ${param.box_big=='2'?'selected':''} >2</option>
						             <option value="3" ${param.box_big=='3'?'selected':''} >3</option>
						             <option value="4" ${param.box_big=='4'?'selected':''} >4</option>
						             <option selected="selected" value="5" ${param.box_big=='5'?'selected':''} >5</option>
						           </select>
						可容納行李(小):<select id="box_small" name="box_small" style="color:black">
						             <option selected="selected" value="1" ${param.box_big=='1'?'selected':''} >1</option>
						             <option value="2" ${param.box_small=='2'?'selected':''} >2</option>
						             <option value="3" ${param.box_small=='3'?'selected':''} >3</option>
						             <option value="4" ${param.box_small=='4'?'selected':''} >4</option>
						             <option value="5" ${param.box_small=='5'?'selected':''} >5</option>
						           </select>
						           	<br>
						車種:<select id="category_id" name="category_id" style="color:black">
						             <option selected="selected" value="1" ${param.box_big=='1'?'selected':''} >一般房車</option>
						             <option value="2" ${param.box_small=='2'?'selected':''} >高級跑車</option>					
						    </select>			           
<%-- 						可容納行李(大):<input type="text" name="box_big" maxlength="1" style="width:25px;color:black" value="${modelaa.box_big}"> --%>
<%-- 						可容納行李(小):<input type="text" name="box_small" maxlength="1" style="width:25px;color:black" value="${modelaa.box_small}"> --%>
						敘述:<textarea id="input7" cols="50" rows="3" name="description" 
						    style="margin-top:10px ;heihgt:30px;width:220px;color:black;overflow: hidden;resize:none;border:1px groove" >${modelaa.description}</textarea>
						   照片:<input name="car_photoX" type="file" accept="image/*" style="display:inline;">video:<input style="display:inline;" name="car_videoX" type="file" accept="video/*" >
						   <br><br>
						<select id="newX" name="newX" style="color:black;display:inline;">
						   <option value="1" ${param.newX=='1'?'selected':''}>新增</option>
						   <option value="2" ${param.newX=='2'?'selected':''}>修改</option>
						</select>
                           <input class="buttonmodify" type="submit" value="保存" style="color:black;margin-bottom:20px">

                           <h4 align="center" style="display:inline;margin-left: 850px">${Message}</h4>


                           </fieldset>
                        </form>    
						<table id="model_table" class="display" >
							<thead style="color:white;background-color:red;"align="center">
								<tr>
									<td>編號</td>
									<td>廠牌</td>
									<td>名稱</td>
									<td>CC數</td>
									<td>尺寸(長/寬/高)</td>
									<td>可乘人數</td>
									<td>可容納行李(大/小)</td>
									<td>圖片</td>
									<td>影片</td>
									<td>敘述</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody style="color:black;"align="center";>

								<c:forEach var="row" items="${select}">
									<tr>
										<td>${row.id}</td>
										<td>${row.brand}</td>
										<td>${row.name}</td>
										<td>${row.cc}cc</td>
										<td>${row.size_l}mm/
										    ${row.size_w}mm/
										    ${row.size_h}mm
										</td>
										<td>${row.seat}</td>
										<td>${row.box_big}/${row.box_small}</td>
										<td><img alt="尚未上傳圖片" src="/TestRentalMVC/resources/car_model/${row.photo}" height="200px" width="300px"></td>
										<td>
										   <c:choose>
										   	<c:when test="${row.video==null}"> 
	                                            <h5>尚未上傳影片</h5>
                                            </c:when>
										    <c:when test="${not empty row.video}"> 
										     <video height="200px" width="300px"  controls autoplay loop muted>
                                                 <source src="/TestRentalMVC/resources/car_model_video/${row.video}" type="video/mp4" ></source>
                                             </video>
                                            </c:when>
                                            <c:otherwise>
                                                <h5>尚未上傳影片</h5>
                                            </c:otherwise>
										    </c:choose>
										</td>
										<td>${row.description}</td>
										<td>
										<form action="modelD.controller" method="post">
										      <input type="hidden" value="${row.id}" name="deletemodelid">
										      <input class="buttondelete" type="submit" value="刪除" onclick="subsub(event)">
										</form>
										<form action="modelE.controller" method="post">
										      <input type="hidden" value="${row.id}" name="deletemodelid">
										      <input class="buttonedit" type="submit" value="編輯">
										</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
				<!-- row -->
<!-- 				<div class="row"> -->
<!-- 					<form class="form" action="NewModel.controller" method="GET"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="category">category:</label>  -->
<!-- 							<select class="custom-select" id="category" name="category"> -->
<!-- 								<option selected>Choose...</option> -->
<%-- 								<c:forEach var="bean" items="${category}"> --%>
<%-- 									<option value="${bean.id}">${bean.name}</option> --%>
<%-- 								</c:forEach> --%>
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="name">name:</label>  -->
<!-- 							<input type="text" class="form-control" id="name" name="name"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="cc">cc:</label>  -->
<!-- 							<input type="text" class="form-control" id="cc" name="cc"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="size_l">長:</label>  -->
<!-- 							<input type="text" class="form-control" id="size_l" name="size_l"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="size_w">寬:</label>  -->
<!-- 							<input type="text" class="form-control" id="size_w" name="size_w"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="size_h">高:</label>  -->
<!-- 							<input type="text" class="form-control" id="size_h" name="size_h"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="seat">seat:</label>  -->
<!-- 							<input type="text" class="form-control" id="seat" name="seat"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="box_big">box大:</label>  -->
<!-- 							<input type="text" class="form-control" id="box_big" name="box_big"> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="box_small">box小:</label>  -->
<!-- 							<input type="text" class="form-control" id="box_small" name="box_small"> -->
<!-- 						</div> -->
<!-- 						<textarea rows=4 cols=54 name="description"> -->
<!-- 如果還有額外需要注意的地方，請您告訴我們，謝謝！  -->
<!-- 						</textarea> -->
<!-- 						<input type="submit" class="btn btn-default">Submit</input> -->
					</form>

            


				</div>
			</div>
			<!-- container -->
			<!--                       改這裡 -->
		</article>
	</div>
</body>
</html>