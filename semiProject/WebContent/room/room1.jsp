<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.8.1.min.js"></script> 

<link href="<%=application.getContextPath() %>/css/room1.css" rel="stylesheet"> 
<script type="text/javascript">

$(document).ready(function() {
    $('.bxslider').bxSlider({
      auto: true,
      autoControls: false,pager:false,controls:false,
	  mode: 'fade',
	  speed: 500,
	  pause: 5000
    });
});

$(function() {
	$("#title2").text("ROOM");
	$("#_01").text("Deluxe Room");
	$("#_02").text("Suite Room");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_01").css("color", "white");
	$("#_02").css("color", "#8877d5");
	$("#_01").click(function() {
		location.href="<%=application.getContextPath()%>/room/room1.jsp";
		
	});
	$("#_02").click(function() {
		location.href="<%=application.getContextPath()%>/room/room2.jsp";
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	});
});

</script>
<!-- <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script>  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Insert title here</title>
<!-- <style type="text/css">

#iframe_lay{
padding-bottom: 30px;
overflow: hidden;
}

.room_area{

width: 900px;
margin: 0 auto;

}

#d1_1{
height: 450px;
width: 900px;	
position: relative;


}

li{

list-style: none;
}

#tip{
  margin-top: 10px;
  font: 13px/24px "NanumBarunGothic",sans-serif;

}

#tip2{
    color: #737373;
    margin-top: 15px;
    font-size: 11px;
}

#left{
float: left;
width: 400px;
height: 154px;;


}
#right{
float: right;

}


#table{

	height:100%;
	width: 100%;
    border-top: 1px solid #ccc;
    border-left: 1px solid #cccccc;

}

#table th{

border-bottom: 1px solid #cccccc;
border-right: 1px solid #cccccc;
    background: #eee;
    text-align: center;
	font-size: 12px;
    font-weight: bold;
    overflow: hidden
}

#table td{
  border-bottom: 1px solid #cccccc;
	    text-align: center;
	    font-weight: bold;
	    border-right: 1px solid #cccccc;

	
	    overflow: hidden;
		font-size: 11px;


}

.pur{


color: #9246bd;
}

#bo{
margin-top: 25px;

}

#ro_area{
overflow: hidden;

}

#btns{
    margin-top: 35px;
    text-align: center;

}

#bp{
    color: #737373;
    text-align: center;
    font-size: 11px;
    margin-top: 15px;
}

#img1{

}

</style>	

 -->
</head>
<body>
 <%@ include file="../temp/header.jspf" %>
 
 <%@ include file="../temp/mHeader_02.jsp" %>
<script src="http://bxslider.com/lib/jquery.bxslider.js"></script>
 
<div id="iframe_lay">
<div class="room_area">

<div id="d1_1">
<ul style="margin: 0; padding:0;" class="bxslider">
<li><img class="main" src="<%=application.getContextPath() %>/image/jy/143347101432bb4b51515a5afde9c5db5398cda14a.jpg"></li>
<li><img id="img1" src="<%=application.getContextPath() %>/image/jy/1433471014411c493bfcd722c51f01218ad60ce0d5.jpg"></li>
</ul>
</div>
<p id="tip"><img src="<%=application.getContextPath() %>/image/jy/ico_dog.jpg"> 퍼플캣의 Standard Room 으로써 1~2마리가 생활하기에 적당합니다.</p>


<div id="ro_area">
<div id="left">

<table  id="table2" cellpadding="0" cellspacing="0" width="100%">
<colgroup>
<col width="150">
<col width="*"> 
</colgroup>
<tr>
<th style="border-top:2px solid #9246bd" rowspan="2">Deluxe Room<br>(최대 2묘)</th><th>1시간 기본요금</th>
</tr> 
<tr>
<th class="time"><p class="pur" >1시간</p>
</tr>
<tr>
<td>1묘</td><td><p class="pur">￦ 2,000</p>
</tr>
<tr>
<td>2묘</td><td><p class="pur">￦ 4,000</p>
</tr>
</table>

</div>
<div id="right">
<img src="<%=application.getContextPath() %>/image/jy/img_coupon2.jpg">
</div>



</div>
<p id="tip2">*추가요금은 요금안내를 참조해주세요.</p>


<div id="bo">
<img src="<%=application.getContextPath() %>/image/jy/img_purple.jpg">
</div>

<div id="btns">
<a href=""><img src="<%=application.getContextPath() %>/image/jy/btn_book.jpg"></a>
</div>
<p id="bp">*태어난 지 6개월 이상 중성화 수술을 하지 않은 아이의 경우 예약 전 전화상담 부탁 드립니다.</p>


</div>
</div>
<%@ include file="../temp/footer.jspf"%>
</body>
</html>