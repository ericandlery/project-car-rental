<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty manager_login_ok}">
<c:redirect url="/manager_zone/manager_login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>據點列表</title>
    <link rel="shortcut icon" href="/TestRentalMVC/images/logo16x16.ico">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="/TestRentalMVC/resources/js/jquery-3.2.1.min.js"></script>
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" type="text/css" href="/TestRentalMVC/resources/css/manager_hf2.css">
    <style>
/*         改這個地方 */
         #out{width:1800px;height:800px;background-color:white;margin:auto;color:white;overflow:auto;} 
/*          thead,tbody,tfoot,tr,th,td{border:solid white 2px;border-collapse:collapse;margin:auto;padding:10px;} */
/*          th{text-align:center;}  */
       #menu{background-color:Highlight;width:110px;height:70px;text-align:center;padding-top:20px;font-size:1.5em;border-radius: 15px;} 
         #title{text-align:center;display:block;font-size:3em;}
         #out{background: rgba(255%,18%,18%,0.2);;margin:auto;color:black;overflow:auto;} 
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

.buttonmodify:hover {
    background-color: #CCEEFF; 
    color: white;
}        
         
.buttondelete {
    background-color: #FFFFBB;
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
    background-color: #FFFFBB;
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
    background-color: #D1BBFF; 
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
    	var r=confirm("確認是否刪除?");
    	if(r==true){
    		return;
    	}else{
    		event.preventDefault();
    		return;
    	}
    }
    
    $(document).ready( function () {
        $('#branch_table').DataTable();
    } );
    </script>
    
</head>
<body>
    <div>
		<header>
			據點列表
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

	
			<div id="out">
<span id="title" style="margin-bottom:10px">據點列表</span></a>
				<form style="margin-left:400px" action="BranchOrderC.controller" method="post" enctype="multipart/form-data">
					<span style="color: red">據點名稱:</span>
					<input value="${UName}" name="indexBranchName" id="indexBranchName" type="text"
						style="color: black">
					<span style="color: red">據點地址:</span>
					<input value="${UAddress}" name="indexBranchAddress" id="indexBranchAddress"
						type="text" style="color: black">
					<span style="color: red">據點電話:</span>
					<input value="${UTele}" name="indexBranchTele" id="indexBranchTele" type="text"
						style="color: black">
					<span style="color: red">地區:</span>
					<select name="selectlocation01">
			               <option value="north"${param.selectlocation=='north'?'selected':''}>北</option>
			               <option value="middle"${param.selectlocation=='middle'?'selected':''}>中</option>
			               <option value="south"${param.selectlocation=='south'?'selected':''}>南</option>    
					</select>
					<span style="color: red">據點照片:</span>
					<input name="branch_photoX" type="file" accept="image/*" style="display:inline;">
						<select id="newX" name="newX">
						   <option value="1" ${param.newX=='1'?'selected':''}>新增</option>
						   <option value="2" ${param.newX=='2'?'selected':''}>修改</option>
						</select> 
						<input class="buttonmodify" type="submit" value="新增/修改" style="color: black; margin-top: '10px'">
					<span style="color: red">${CRUD_C}</span>
				</form>


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
				<form style="margin-left:800px;margin-top:20px;margin-bottom:10px "action="selecetLocation.controller" method="post">
			              <span style="color:red;margin-left:20px;margin-right:10px ">篩選據點:</span><select  name="selectlocation">
			               <option value="all"${param.selectlocation=='all'?'selected':''}>全部</option>
			               <option value="north"${param.selectlocation=='north'?'selected':''}>北</option>
			               <option value="middle"${param.selectlocation=='middle'?'selected':''}>中</option>
			               <option value="south"${param.selectlocation=='south'?'selected':''}>南</option>     
			             </select>
			                <input type="submit" value="篩選"class="buttonmodify" style="color: black">             
			    </form>
			             <h3 style="color: red;margin-left:800px;">${CRUD_D}</h3>
                <c:choose>
                	<c:when test="${empty branch_list}">
                	<h1>${no_branch}</h1>
                	</c:when>
                	<c:otherwise>
                	    
                		<table id="branch_table" class="display" style="border-color:black;">
							<thead style="background-color:#CCBBFF;text-align:center;">
								<tr >
									<th class="sss">據點名稱</th>
									<th class="sss">地址</th>
									<th class="sss">電話</th>
									<th class="sss">地區</th>
									<th class="sss">相片</th>
									<th class="sss">操作</th>
								</tr>
							</thead>
							<tbody >
							<c:forEach var="b" items="${branch_list}">
								
									<tr >
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">${b.name}</td>
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">${b.address}</td>
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">${b.tele}</td>
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">${b.location}</td>
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">
										   <img alt="尚未上傳圖片" src="/TestRentalMVC/resources/Branch_photo/${b.photo}" height="200px" width="300px">
										</td>
										<td width="2%" align="center" style="background-color:#CCDDFF;border-color:black;">
											<form action="BranchOrderD.controller" method="post">
												<input name="deleteBranchName" type="hidden"
													value="${b.name}"><br> <input
													class="buttondelete" type="submit" value="刪除"
													onclick="subsub(event)"
													style='color: black; margin-top: "10px"'> <br>						
											</form>
											
											<form action="BranchOrderU.controller" method="post">
												<input name="updateBranchName" type="hidden"
													value="${b.name}">
													<input
													name="updateBranchAddress" type="hidden"
													value="${b.address}">
													<input name="updateBranchTele" type="hidden" value="${b.tele}">
												    <input name="updateBranchPhoto" type="hidden" value='${b.photo}'><br>
												    
													<input
													class="buttonedit" type="submit" value="編輯"
													style='color: black; margin-top:"10px"'>
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
<%--         <%@ include file='/shared/footer.jsp'%> --%>
    </div>
    
</body>
</html>