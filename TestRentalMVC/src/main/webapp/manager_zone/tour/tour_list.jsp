<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty manager_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>旅遊管理</title>
<link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/TestRentalMVC/resources/css/manager_hf2.css">
    <style>
/*         改這個地方 */
         #out{width:90%;height:800px;background-color:white;margin:auto;color:white;overflow:auto;} 
/*          thead,tbody,tfoot,tr,th,td{border:solid white 2px;border-collapse:collapse;margin:auto;padding:10px;} */
/*          th{text-align:center;}  */
       #menu{background-color:Highlight;width:110px;height:70px;text-align:center;padding-top:20px;font-size:1.5em;border-radius: 15px;} 
         #title{text-align:center;display:block;font-size:3em;}
         #out{background-color:#AAAAAA;margin:auto;color:black;overflow:auto;} 
         form{color:black;}
 .sss{
 
 text-align:center;

 }
 .testindex{
     background-color: #77DDFF;
    border: none;
    color: white;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 10px;
 }
 .testindex:hover {
    background-color: #CCEEFF; 
    color: white;
}  
 .buttonmodify {
    background-color: #444444;
    border: none;
    color: white;
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
    background-color: #AAAAAA; 
    color: white;
}        
         
.buttondelete {
    background-color: #CC0000;
   border: none;
    color: white;
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
    background-color: #000000;
    border: none;
    color: white;
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
    background-color: #8e8e8e; 
    color: white;
}

/*         改這個地方 */
    </style>
    <!-- TEST -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<!-- TEST -->
    <script>
    function subsub(event){
    	var r=confirm("確定刪除該景點?");
    	if(r==true){
    		return;
    	}else{
    		event.preventDefault();
    		return;
    	}
    }
    
    $(document).ready( function () {
        $('#tour_table').DataTable();
    } );
    </script>
    
</head>
<body>
    <div>
        <header>
			景點列表
			<div>
				<a href="/TestRentalMVC/manager_zone/manager_zone.jsp"><img
					src="/TestRentalMVC/images/home160x160.png"></a> <span><a
					href="/TestRentalMVC/index.jsp"><img
						src="/TestRentalMVC/images/logout180x130.png"></a></span>
			</div>
		</header>
        <nav></nav>
        
        <article>
<!--                      改這裡 -->

			
       	
	 <form style="margin-left:400px" action="tour_insert.controller" method="post"  enctype="multipart/form-data">
														
<!-- 					 enctype="multipart/form-data" 上傳圖片必備 -->
					
					
					<span style="color: black ;font-weight:bold">編號:</span>
					<input value="${tourUpdate.id}" name="indexTourId" id="indexTourId" type="text"
						style="color: black">
					<span style="color: black ;font-weight:bold">名稱:</span>
					<input value="${tourUpdate.name}" name="indexTourName" id="indexTourName" type="text"
						style="color: black">
					<span style="color: black ;font-weight:bold">地址:</span>
					<input value="${tourUpdate.address}" name="indexTourAddress" id="indexTourAddress"
						type="text" style="color: black">
					<span style="color: black ;font-weight:bold">價錢:</span>
					<input value="${tourUpdate.price}" name="indexTourPrice" id="indexTourPrice" type="text"
						style="color: black">
		
						
<!-- 					<span style="color: red">照片:</span> -->
<%-- 					<input value="${tourUpdate.photo}" name="indexTourPhoto" id="indexTourPhoto" type="text" --%>
<%-- 						value='<img  src=" ">' style="color: black"> --%>
						
						<span style="color: black ;font-weight:bold">據點:</span>
					<input value="${tourUpdate.branch_name}" name="indexTourBranch_name" id="indexTourBranch_name" type="text"
						style="color: black"></br>
						
						
						
						
						<span style="color: black ;font-weight:bold">敘述:</span>
					<input value="${tourUpdate.description}" name="indexTourDescription" id="indexTourDescription" type="text"
						style="color: black">
						<span style="color: black ;font-weight:bold">地區:</span>
					<input value="${tourUpdate.area}" name="indexTourArea" id="indexTourArea" type="text" 
						style="color: black "></br>
					
								
				 <span style="color: black ;font-weight:bold">照片:${tourUpdate.photo}</span><input  name="tour_photoX" type="file" accept="image/*" >
<!-- 						 video:<input name="car_videoX" type="file" accept="video/*" > -->
<!--                            <input class="buttonmodify" type="submit" value="確定上傳" style="color:black;margin-bottom:20px"> -->
<%--                            <h3 align="center" style="display:inline ; color: red  " >${addTourPoto}</h3> --%>
					
					
						<select id="select" name="select">
						   <option value="1" ${param.select=='1'?'selected':''}>新增</option>
						   <option value="2" ${param.select=='2'?'selected':''}>修改
						   </option>
						</select> 
						
						<div>
						<input class="buttonmodify" type="submit" value="新增/修改" style="float:left;color: #FFFFFF; margin-top: '10px';font-weight:bold">
					<p style="float:content;color:red;font-size:30px; font-weight:bold ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${noDate}${dateTour}${delTour}</p></div>
					</form>
					
					
					
<!-- 					<p style="color: red ; font-size: 80px; text-align:center " ></p> -->
<!-- 		<p style="color: red ; font-size: 80px; text-align:center "></p> -->
				
        
					
<!-- 				<form action="selectAllBranchOrder.controller" method="get"> -->
<!-- 					<span -->
<!-- 						style="color: red; margin-left: 20px; margin-right: 10px; margin-left: 800px">據點排序:</span> -->
<!-- 					<select name="order"> -->
<!-- 						<option value="name">據點名稱</option> -->
<!-- 						<option value="address">地址</option> -->
<!-- 						<option value="tele">電話</option> -->
<!-- 						<option value="photo">相片</option> -->
<!-- 					</select> <select name="sort"> -->
<!-- 						<option value="asc">小到大</option> -->
<!-- 						<option value="desc">大到小</option> -->
<!-- 					</select> <input type="submit" value="排序" class="buttonmodify" -->
<!-- 						style="color: black"> -->
<!-- 				</form> -->
<!-- 				<form style="margin-left:800px;margin-top:20px;margin-bottom:10px "action="selecetLocation.controller" method="post"> -->
<!-- 			              <span style="color:red;margin-left:20px;margin-right:10px ">篩選據點:</span><select  name="selectlocation"> -->
<%-- 			               <option value="all"${param.selectlocation=='all'?'selected':''}>全部</option> --%>
<%-- 			               <option value="north"${param.selectlocation=='north'?'selected':''}>北</option> --%>
<%-- 			               <option value="middle"${param.selectlocation=='middle'?'selected':''}>中</option> --%>
<%-- 			               <option value="south"${param.selectlocation=='south'?'selected':''}>南</option>      --%>
<!-- 			             </select> -->
<!-- 			                <input type="submit" value="篩選"class="buttonmodify" style="color: black">              -->
<!-- 			    </form> -->

				<div id="out">

                <c:choose>
                	<c:when test="${empty all}">
                	<h1>${noTour}</h1>
                	</c:when>
                	<c:otherwise>
                		<table id="branch_table" class="display" style="border-color:black;">
							<thead style="background-color:#666666;text-align:center;">
								<tr style=color:#FFFFFF>
									<th class="sss">編號</th>
									<th class="sss">名稱</th>
									<th class="sss">地址</th>
									<th class="sss">價錢</th>
									<th class="sss">相片</th>
									<th class="sss">據點</th>
									
									<th class="sss">敘述</th>
									<th class="sss">地區</th>
									<th class="sss">編輯</th>
									
								</tr>
							</thead>
							<tbody >
							<c:forEach var="all" items="${all}">
								
									<tr >
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.id}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.name}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.address}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.price}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">
										
										
										<img alt="沒圖片" src="/TestRentalMVC/resources/tour/${all.photo}" height="200px" width="300px">
										
										
										</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.branch_name}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.description}</td>
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">${all.area}</td>
													
										
										
										
										
										<td width="2%" align="center" style="background-color:#FFE4E1;border-color:black;">
											<form action="tour_delete.controller" method="post">
												<input name="tourDeleteId" type="hidden"
													value="${all.id}"><br> <input
													class="buttondelete" type="submit" value="刪除"
													onclick="subsub(event)"
													style='color: #FFFFFF; margin-top: "10px";font-weight:bold'> <br>
												
											</form>
											
										

							<form action="tourUpdate.controller" method="get">
                				      <input name="Id" type="hidden" value="${all.id}">
                				      <input class="buttonedit" style='font-weight:bold' type="submit" value="編輯">
                				</form>

										</td>
									</tr>
								

							</c:forEach>
							</tbody>
						</table>
                	</c:otherwise>
                </c:choose>
                
            </div>
		
<!--                       改這裡 -->
        </article>

    </div>
   
    
</body>
</html>