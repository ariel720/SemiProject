<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#intro{
text-align: center;
}
#img{
width: 821px;
height: 320px;
margin: 0 auto;
}
#i_change{
	margin-top: 50px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_01").css("color", "white");
		$("#_02").css("color", "#8877d5");
		$("#_03").css("color", "#8877d5");
		$("#_02").click(function(){
			location.href="<%=application.getContextPath()%>/intro/service.jsp";
		});
		$("#_03").click(function(){
			location.href="<%=application.getContextPath()%>/intro/location.jsp";
		});
	});
</script>
</head>
<body>
<!-- header -->
	<%@ include file="../temp/header.jspf" %>
	
	
<%@ include file="../temp/mHeader_intro.jsp" %>

<div id="i_change">

<div id="intro">
<img src="<%=application.getContextPath()%>/image/sh/intro/intro2.jpg">
<br>
<img src="<%=application.getContextPath()%>/image/sh/intro/hello.jpg">
</div>


</div>
<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>
</body>
</html>