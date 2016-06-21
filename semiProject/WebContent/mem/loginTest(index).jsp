
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
	#mo {
		width: 1500px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.member ne null}">
			<h2><a href="/semiProject/mem/logout.jsp">로그아웃</a></h2>
		</c:when>
		<c:otherwise>
			<input type="button" value="로그인" data-toggle="modal" data-target="#myModal_01">
				<div class="modal fade" id="myModal_01" role="dialog">
			    <div class="modal-dialog" id="mo">
					<%@ include file="./login.jsp" %>
				</div>
				</div>
			<input type="button" value="회원가입" data-toggle="modal" data-target="#myModal_02">
				<div class="modal fade" id="myModal_02" role="dialog">
			    <div class="modal-dialog" id="mo">
					<%@ include file="./join.jsp" %>
				</div>
				</div>
		</c:otherwise>
	</c:choose> 
	
	<h2><a href="../mem/myInfo.jsp">마이페이지</a></h2>
	
</body>
</html>