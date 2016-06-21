<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">


#re{
margin: 0 auto;
width: 900px;


}

#retable th{

border-bottom: 1px solid #cccccc;
border-right: 1px solid #cccccc;
    background: #eee;
    text-align: center;
    padding: 10px 0;
font-size: 12px;
    font-weight: bold;

}

#retable td{
	    border-bottom: 1px solid #cccccc;
	    text-align: center;
	    font-weight: bold;
	    border-right: 1px solid #cccccc;
	      padding: 0 20px;
		
	    overflow: hidden;
		font-size: 12px;
	
}
.time{


line-height: 18px;
background: #fafafa;
font-weight: bold;

}
table{
    border-left: 1px solid #cccccc;
    border-top: 1px solid #ccc;
}

.pur{
    color: #9246bd;


}

.pur2
{
       color: #5c46bd;



}

#retable1{
margin-top: 20px;

}

#retable1 th{

border-bottom: 1px solid #cccccc;
border-right: 1px solid #cccccc;
    background: #eee;
    text-align: center;
    padding: 10px 0;
	font-size: 12px;
    font-weight: bold;

}
#retable1 td{
	    border-bottom: 1px solid #cccccc;
	    text-align: center;
	    font-weight: bold;
	    border-right: 1px solid #cccccc;
	      padding: 0 20px;

	    overflow: hidden;
	font-size: 12px;

}
.mt50{
margin-top: 50px;

}

#bt{
margin-top: 35px;
text-align: center;

}

#bp{

    color: #737373;
    text-align: center;
    font-size: 11px;
    margin-top: 15px;


}
#re{
	margin-top: 50px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#title1").text("Reservation");
		$("#_01").text("Operation Guide");
		$("#_02").text("Reservation");
		$("#_03").text("PICK UP & DROP");
	})
	$(function() {
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_01").css("color", "white");
		$("#_02").css("color", "#8877d5");
		$("#_03").css("color", "#8877d5");
		$("#_02").click(function(){
			location.href="<%=application.getContextPath()%>/res/resWrite.jsp";
		});
		$("#_03").click(function(){
			location.href="<%=application.getContextPath()%>/res/pick.jsp";
		});
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jspf" %>
<%@ include file="../temp/mHeader_01.jsp" %>

<div id="re">
<div ><img src="<%=application.getContextPath() %>/image/jy/rev_step02.jpg"></div>
<table  id="retable" cellpadding="0" cellspacing="0" width="100%">
<colgroup>
<col width="150">
</colgroup>
<tr>
<th style="border-top:2px solid #9246bd" rowspan="2">Purple Room<br>(최대 2묘)</th><th>1박 기본요금</th><th colspan="4">추가요금</th>
</tr> 
<tr>
<th class="time"><p class="pur">24시간</p></th><th  class="time">3시간</th><th  class="time">6시간</th><th  class="time">2시간</th><th  class="time">12시간이후</th>
</tr>
<tr>
<td>1묘</td><td><p class="pur">￦ 30,000</p></td><td>￦6,000</td><td>￦12,000</td><td>￦21,000</td><td>￦30,000</td>
</tr>
<tr>
<td>2묘</td><td><p class="pur">￦ 35,000</p></td><td>￦7,000</td><td>￦14,000</td><td>￦24,500</td><td>￦35,000</td>
</tr>
</table>

<table  id="retable1" cellpadding="0" cellspacing="0" width="100%">
<colgroup>
<col width="150">
</colgroup>
<tr>
<th style="border-top:2px solid #5c46bd;" rowspan="2">Purple Room<br>(최대 2묘)</th><th>1박 기본요금</th><th colspan="4">추가요금</th>
</tr> 
<tr>
<th class="time"><p class="pur2">24시간</p></th><th  class="time">3시간</th><th  class="time">6시간</th><th  class="time">2시간</th><th  class="time">12시간이후</th>
</tr>
<tr>
<td>1묘</td><td><p class="pur2">￦ 40,000</p></td><td>￦8,000</td><td>￦16,000</td><td>￦28,000</td><td>￦40,000</td>
</tr>
<tr>
<td>2묘</td><td><p class="pur2">￦ 45,000</p></td><td>￦9,000</td><td>￦18,000</td><td>￦31,500</td><td>￦35,000</td>
</tr>
<tr>
<td>3묘</td><td><p class="pur2">￦ 50,000</p></td><td>￦10,000</td><td>￦20,000</td><td>￦32,500</td><td>￦50,000</td>
</tr>
<tr>
<td>4묘</td><td><p class="pur2">￦ 55,000</p></td><td>￦11,000</td><td>￦22,000</td><td>￦38,500</td><td>￦55,000</td>
</tr>

</table>

<div class="mt50"> <img src="<%=application.getContextPath() %>/image/jy/rev_step01.jpg"></div>

<div class="mt50"><img src="<%=application.getContextPath() %>/image/jy/rev_step03.jpg"> </div>
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