<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#l_change{
text-align: center;
margin-top: 50px;
}


#map {

	margin: 0;
	padding: 0;

	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px; 
}



#img{
width: 821px;
height: 320px;
margin: 0 auto;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_03").css("color", "white");
	$("#_02").css("color", "#8877d5");
	$("#_01").css("color", "#8877d5");
	$("#_01").click(function(){
		location.href="<%=application.getContextPath()%>/intro/intro2.jsp";
	});
	$("#_02").click(function(){
		location.href="<%=application.getContextPath()%>/intro/service.jsp";
	});
});
</script>
</head>
<body>
<!-- header -->
	<%@ include file="../temp/header.jspf" %>
<%@ include file="../temp/mHeader_intro.jsp" %>
	<div id="l_change">

	<div id="map">

		<a
			href="http://map.naver.com/?query=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EC%A2%85%EB%A1%9C%EA%B5%AC+%EC%9C%A8%EA%B3%A1%EB%A1%9C+223">
			<img id="img" src="<%=application.getContextPath()%>/image/sh/intro/map.jpg"
			onmouseover="this.src='<%=application.getContextPath()%>/image/sh/intro/map2.JPG'"
			onmouseout="this.src='<%=application.getContextPath()%>/image/sh/intro/map.jpg'"></a>

	</div>


	
	<img src="<%=application.getContextPath()%>/image/sh/intro/loca.jpg">
	</div>

<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>
</body>
</html>