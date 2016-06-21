<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<style type="text/css">
#intro{
text-align: center;
}

/* #change{
width: 1100px;
}
 */
</style>
<%@ include file="../temp/mHeader_01.jsp" %>
</head>
<body>

<div id="change">

<div id="intro">
<img src="<%=application.getContextPath()%>/image/sh/intro/intro2.jpg">
<br>
<img src="<%=application.getContextPath()%>/image/sh/intro/hello.jpg">
</div>


</div>

<script type="text/javascript">

$(function () {
	$("#_01").text("Intro");
});

$(function () {
	$("#_02").text("Service");
});

$(function () {
	$("#_03").text("Location");
});

 
$(function(){
	$("#_01").click(function(){
		$.ajax({ url:"<%=application.getContextPath()%>/intro/intro2.jsp",  type:"POST",  data: {data:$("#i_change").html()}  ,
			success: function(result){$("#change").html(result);} });	
	});	
});	

	
$(function(){
	$("#_02").click(function(){
		$.ajax({ url:"<%=application.getContextPath()%>/intro/service.jsp",  type:"POST",  data: {data:$("#s_change").html()}  ,
			success: function(result){$("#change").html(result);} });	
	});	
});	

$(function(){
	$("#_03").click(function(){
		$.ajax({ url:"<%=application.getContextPath()%>/intro/location.jsp",  type:"POST",  data: {data:$("#l_change").html()}  ,
			success: function(result){$("#change").html(result);} });	
	});	
});	

</script>




</body>
</html>