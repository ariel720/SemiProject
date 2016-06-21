<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
</head>
<body>

<!-- section -->
<%@ include file="../temp/mHeader_02.jsp" %>


<script type="text/javascript">

$(function () {
	$("#_01").text("Notice");
});

$(function () {
	$("#_02").text("Free Board");
});

$(function () {
	$("#title").html('<img src="<%=application.getContextPath()%>/image/sh/board_title.jpg">');
});

</script>

<div id="change">


</div>

<script type="text/javascript">

 
$(function(){
	$("#_01").click(function(){
				alert("안녕");//
		$.ajax({ url:"<%=application.getContextPath()%>/notice/list.nt",  type:"POST",
			data: {
			/* 	data: $("#l_change").html(), */
				cp:1
			} ,
			success: function(result){
				alert(result);//
				
				$("#change").html(result);
				},
			error: function(status){
				alert("error"+status);
			}
			
		});	
	});	
});	

	
$(function(){
	$("#_02").click(function(){
		$.ajax({ url:"<%=application.getContextPath()%>/free/list.fr",  type:"POST",  data: {data:$("#l_change").html()}  ,
			success: function(result){$("#change").html(result);} });	
	});	
});	

</script>


</body>
</html>