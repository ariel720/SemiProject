<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#se{
	}
</style>
  	
</head>
<body>
<input type="hidden" id="message" value="${message}">
<!--	header	  -->

<%@ include file="temp/header.jspf" %>

<!-- 	section	  -->
<div id="se">




<%@ include file="temp/main.jspf" %>


</div>


<!-- 	footer 	  -->

<%@ include file="temp/footer.jspf" %>
<script type="text/javascript">
	
	$(function() {

		if($("#message").val() != ""){
			alert($("#message").val());
		}
	});
</script>
</body>
</html>