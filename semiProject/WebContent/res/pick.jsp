<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#reprice{
margin: 0 auto;
width: 900px;

}

#bp{

    color: #737373;
    text-align: center;
    font-size: 11px;
    margin-top: 15px;

}
#reprice{
	margin-top: 50px;
}
#bt{
margin-top: 35px;
text-align: center;

}

</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#title1").text("Reservation");
		$("#_01").text("Operation Guide");
		$("#_02").text("Reservation");
		$("#_03").text("PICK UP & DROP");
	})
	$(function() {
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_01").css("color", "#8877d5");
		$("#_02").css("color", "#8877d5");
		$("#_03").css("color", "white");
		$("#_02").click(function(){
			location.href="<%=application.getContextPath()%>/res/resWrite.jsp";
		});
		$("#_01").click(function(){
			location.href="<%=application.getContextPath()%>/res/price.jsp";
		});
	});
</script>
<body>

<%@ include file="../temp/header.jspf" %>
<%@ include file="../temp/mHeader_01.jsp" %>
<div id="reprice">

<div><img src="<%=application.getContextPath() %>/image/jy/img_pick.jpg"></div>
<div id="bt"><img src="<%=application.getContextPath() %>/image/jy/btn_book.jpg"> </div>
<p id="bp">*태어난 지 6개월 이상 중성화 수술을 하지 않은 아이의 경우 예약 전 전화상담 부탁 드립니다.</p>

</div>
<script type="text/javascript">
	$(function() {
		$("#bt").css("cursor","pointer");
		$("#bt").click(function() {
			location.href="<%=application.getContextPath()%>/res/resWrite.jsp";
		});
		
	});
</script> 


<%@ include file="../temp/footer.jspf"%>
</body>
</html>