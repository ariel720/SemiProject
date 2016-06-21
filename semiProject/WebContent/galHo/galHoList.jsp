<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
	#galHo_body{
		width: 1050px;
		margin: 0 auto;
	}
	/* #galHo_body_h{
		background-color: yellow;
	}
	#galHo_body_b{
		background-color: blue;
	} */
	#galHo_body_h1{
		border-spacing: 1px;
		border-collapse: collapse;
	}
	#galHo_body_h1 td{
		width: 100%;
		
	}
	
	#galHo_body_b1{
		border-spacing: 1px;
		border-collapse: collapse;
	}
	#galHo_body_b1 td{
		text-align:center;
		width:225px;
		/* border: 1px solid gray; */
		border-bottom: 1px solid gray;
		border-top: 1px solid gray; 
	}
	
	#galHo_body_b1_cont{
		table-layout :fixed;
		width: 225px;
		height: 400px;
	}
	#galHo_body_b1,#galHo_body_b1_title,#galHo_body_b1_cont img{
		width: 225px;
	}
	#galHo_body_b1{
		float: left;
		margin-right:15px; 
		margin-left:15px;
		margin-bottom: 20px;
	}
	#d1{
		clear: both;
		text-align: right;
		border-top: 1px gray solid;
	}
	#d2{
		width: 100%;
		text-align: center;
		
	}
	#galHo_body_b1_title, #total{
		
		font-weight: bolder;
	}
	#galHo_body_h1{
		width:100%;
		border-bottom: 1px solid gray;
		margin-bottom: 10px;
	}
	
	#galHo_body_b a ,#d2 a{
		text-decoration: none;
		color: gray;
	}
	
	#galHo_body_b a:VISITED,#d2 a:VISITED{
		color: gray;
	}
	
	#galHo_body_b a:HOVER,#d2 a:HOVER{
		color: black;
		font-weight: bolder;
	}
	
		#galHo_body input[type=button],#galHo_body input[type=submit]{
		background-color: gray;
		color: white;
		font-weight:bolder;
		border-radius:7px;
		width: 80px;
		height: 30px;
	}
	#galHo_body{
		margin-bottom: 50px;
	}
	#galHo_body{
		margin-top: 50px;
	}
	#galHo_body_b1_title{
		max-width: 225px;
		min-width: 5px;
		white-space :nowrap;
		overflow : hidden;
		text-overflow:ellipsis;
	}
</style>
<script type="text/javascript">
$(function() {
	$("#write").click(function() {
		location.href="galHoWrite.jsp";
	});
});


$(function() {
	$("#title2").text("Gallery");
	$("#_01").text("Hotel");
	$("#_02").text("Cats");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_01").css("color", "white");
	$("#_02").css("color", "#8877d5");
	$("#_01").click(function() {
		location.href="<%=application.getContextPath()%>/galHo/galHoList.gh?curPage=1"
		
	});
	$("#_02").click(function() {
		location.href="<%=application.getContextPath()%>/galCat/galCatList.gc?curPage=1"
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	});
});
</script>

</head>
<body>
	<!-- header -->
	<%@ include file="../temp/header.jspf" %>
	<!-- section -->
	<%@ include file="../temp/mHeader_02.jsp" %>
	<div id="galHo_body">
		<div id="galHo_body_h">
			<table id="galHo_body_h1">
				<tr>
					<td id="total">Total : ${requestScope.page['totalList'] }  Article</td>
				</tr>
			</table>
		</div>
		
		<div id="galHo_body_b">
			<c:forEach items="${requestScope.list }" var="list">
			<a href="galHoView.gh?num=${list['num'] }&curPage=${param.curPage }">
			<table id="galHo_body_b1">
				<tr>
					<td id="galHo_body_b1_cont">
					<img src="<%=application.getContextPath() %>/upload/${list['imagefile'] }"> 
					</td>	
				</tr>
				<tr>
					<td id="galHo_body_b1_title"><a href="galHoView.gh?num=${list['num'] }&curPage="+${param.curPage }>${list['title']} (${list['re_counts'] })</a></td>
				</tr>
			</table>
			</a>
			</c:forEach>
			
		</div>
		<div id="d1">
		<c:if test="${(member['id'] eq 'admin') &&  (member['id'] ne null)}">
		<input type="button" id="write" value="글쓰기">
		
		</c:if>
		</div>
		<div id="d2">
			<c:if test="${page['curBlock']>1 }">
				<a href="galHoList.gh?curPage=${page['startNum']-1 }">[prev]</a>
			</c:if>
			<c:forEach begin="${page['startNum'] }" end="${page['lastNum'] }" var="i" step="1">
				<a href="galHoList.gh?curPage=${i }">${i }</a>
			</c:forEach>
			<c:if test="${page['curBlock']< page['totalBlock'] }">
				<a href="galHoList.gh?curPage=${page['lastNum']+1 }">[next]</a>
			</c:if>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>
</body>
</html>