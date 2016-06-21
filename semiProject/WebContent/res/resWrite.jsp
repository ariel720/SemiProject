<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

 -->

<link rel='stylesheet'
	href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css' />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>





<style type="text/css">
A:link    {color:none;text-decoration:none;} /* 아직 방문하지 않은경우 */

A:visited {color:inherit; text-decoration:underline; } /* 한번 이상 방문한 링크 처리 */

A:active  {color:none; text-decoration:none; }/* 마우스로 클릭하는 순간 */

A:hover  {color:purple; text-decoration:none; } /* 마우스 링크 위 올려 놓았을때 */





#resv_area {
	position: relative;
	width: 900px;
	margin: 0 auto;
}

.tip {
	position: absolute;
	right: 0;
	top: 10px;
	margin-top: 10px;
	font: 13px/24px "NanumBarunGothic", sans-serif;
}

#roomcheck {
/* 	overflow: hidden;
 */	height: 280px;
	position: relative;
}

.roomcheck label {
	float: left;
	width: 450px;
	height: 280px;
	cursor: pointer;
}

#roomcheck input {
	position: absolute;
	left: -5000px;
}

.deluxe {
	background: url(../image/jy/purple_off.jpg) no-repeat;
	display: block;
	height: 280px;
	width: 450px;
	float: left;
}

.sweet {
	background: url(../image/jy/violet_off.jpg) no-repeat;
	display: block;
	height: 280px;
	width: 450px;
	float: left;
}

.resv_wrap {
	margin-top: 35px;
	overflow: hidden;
}

.cal_area {
	float: left;
	width: 315px;
}

.cal_area input {
	width: 132px;
	height: 30px;
	padding: 0 8px;
	border: 1px solid #cccccc;
}

.re_t {
	margin-bottom: 15px;
	font: bold 12px dotum;
	color: #4c4c4c;
	list-style: none;
}

.re_t2 {
	width: 300px;
	margin-bottom: 15px;
	font: bold 12px dotum;
	color: #4c4c4c;
	list-style: none;
	float: left;
}

.re_t3 {
	width: 240px;
	float: right;
	margin-bottom: 15px;
	font: bold 12px dotum;
	color: #4c4c4c;
	list-style: none;
}

#datepicker {
	color: #fd6566;
	background: url(../image/jy/ico_cal.jpg) no-repeat 125px 7px;
	font-size: 12px;
	width: 150px;
}

#datepicker2 {
	color: #9b59c2;
	font-size: 12px;
	float: right;
	background: url(../image/jy/ico_cal.jpg) no-repeat 125px 7px;
	width: 150px;
}

.price_wrap {
	float: right;
	width: 555px;
}

#retime {
	width: 555px;
	overflow: hidden;
}

#start_time {
	width: 240px;
	height: 32px;
	padding: 5px;
	border: 1px solid #cccccc;
	font-size: 12px;
}
#r_name{
	width: 240px;
}
#end_time {
	width: 240px;
	height: 32px;
	padding: 5px;
	border: 1px solid #cccccc;
	float: right;
	font-size: 12px;
}

.price_table th {
	color: #4c4c4c;
	font-weight: bold;
	padding: 15px 0;
	border-bottom: 1px dashed #dedede;
	text-align: left;
	font-size: 12px;
}

.price_table td {
	color: #4c4c4c;
	text-align: right;
	font: bold 16px;
	padding: 15px 0;
	border-bottom: 1px dashed #dedede;
}

.price_table input {
	width: 200px;
	border: 1px solid #c0c0c0;
	height: 27px;
}

.price_table {
	width: 100%;
}

#catnum {
	width: 240px;
	border: 1px solid #c0c0c0;
	height: 31px;
}

#ph input {
	width: 76px;
}

#calender table {
	border-spacing: 0px;
	border-collapse: collapse;
	width: 315px;
	height: 315px;
	font-size: small;
	border: 1px solid gray;
	margin-top: 10px;
}

#myo1 {
	
}

#myo2 {
	display: none;
}

.tip1	{
    color: #737373;
    margin-top: 15px;
    font-size: 11px;
    text-align: center;

}

.tip2{
    color: #737373;
    margin-top: 10px;
    font: 15px "NanumBarunGothic",sans-serif;
    text-align: center;
	
}

#subimg{
text-align: center;
margin-top: 25px;

}

#ttprice{
border: none;
font-size: 20px;
text-align: right;
}
.imgss{
	display: block;
}

</style>
<script type="text/javascript">


 
	
	

	



/* 
	$(function() {

		 $("#k").on("click", function() {

			var a = $("#start_time").val();
			var b = $("#end_time").val();

			var aa = $("#datepicker").val();
			var bb = $("#datepicker2").val();

			var arr1 = aa.split('-');
			var arr2 = bb.split('-');

			//년                  월            일
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
			var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

			var diff = dat2 - dat1;
			var currday = 24 * 60 * 60 * 1000;

			var day = diff / currday; //일수차이
			 var total=0;

			if ($(".catroom").is(":checked")) {

				if ($("#deluxeRoom").is(":checked")) {
					var room1price = 30000;

					if ($("#catnum").val() == "2") {

						var numprice = 5000 * day;
					
						total_price = day * room1price + numprice;

					} else if ($("#catnum").val() == "1") {
						total_price = day * room1price
					} else {
					}
					;

				} else if ($("#sweetRoom").is(":checked")) {
					var room2price = 40000;
					if ($("#catnum").val() == "2") {
						var numprice = 5000 * day;
						total_price = day * room2price + numprice;

					} else if ($("#catnum").val() == "3") {
						var numprice = 10000 * day;
						total_price = day * room2price + numprice;

					} else if ($("#catnum").val() == "4") {
						var numprice = 15000 * day;
						total_price = day * room2price + numprice;

					} else if ($("#catnum").val() == "1") {
						total_price = day * room2price

					}
					;
					
				}
				;
			}
			;
		});
	});  
 */
	//방 선택하는 섹션 이미지 관련 & 고양이 수 체크. 
	
	$(function() {
		$("#deluxeRoom").on(
				"click",
				function() {

					if (this.checked) {

						$(".deluxe").css("background-image",
								"url(../image/jy/purple_on.jpg)")
						$(".sweet").css("background-image",
								"url(../image/jy/violet_off.jpg)")
						$(".myo2").css("display", "block")
						$(".myo2").css("display", "none")
					}
					;
				});
		
	});

	$(function() {
		$("#sweetRoom").on(
				"click",
				function() {

					if (this.checked) {

						$(".sweet").css("background-image",
								"url(../image/jy/violet_on.jpg")
						$(".deluxe").css("background-image",
								"url(../image/jy/purple_off.jpg")
						$(".myo2").css("display", "block")
						
					}
				});
	});
	
										

	$(function() {  
		
			

		$(".pri").change( function() {
				
				
				var a = $("#start_time").val();
				var b = $("#end_time").val();
				
				var ar1 = a.split(':');
				var ar2 = b.split(':');
				
				var time1 = ar1[0];
				var time2 = ar2[0];
				
			
				
				var aa = $("#datepicker").val();
				var bb = $("#datepicker2").val();

				var arr1 = aa.split('-');
				var arr2 = bb.split('-');

				//년                  월            일
				var dat1 = new Date(arr1[0], arr1[1], arr1[2], ar1[0] ,ar1[1]);
				var dat2 = new Date(arr2[0], arr2[1], arr2[2], ar2[0] ,ar2[1] );

				var diff = dat2 - dat1;
				var currtime =  60 * 60 * 1000;

				var time = Number(diff) / Number(currtime); //시간
				
					var catnum = $("#catnum").val(); //고양이수
					
					/* var dayprice = day*24; 
					
					var ti= 24;
					
					var timepay1 = ti-time1; 
					
					var timepay2 = sttimeprice=time2;
					
					
					var price = Number(dayprice)+Number(timepay2); //같은날 아닐때
					var price2 = time2-time1;  //같은잘짜
					 */
					
					
					 
			 if ($(".catroom").is(":checked")) {
			
				 
				if ($("#deluxeRoom").is(":checked")) {
						var roomprice = 2000;
						
						var totalprice = time*roomprice*catnum;
						
				}else if($("#sweetRoom").is(":checked")) {
						var roomprice = 3000;
						var totalprice = time*roomprice*catnum;
						
					
				}
				
					
			 
			
			if ($(".box").val() == "") {
				
				
			}else{
			$("#ttprice").val(totalprice+"원");	
			}
			
		}else { alert("방을 선택하세요");
		
		} 
		
		});
		});
	
	
		//일수가 -일때
	
		 $(function() {  
			
			

			$("#datepicker2").change (function() {
				
				
				
				var aa = $("#datepicker").val();
				var bb = $("#datepicker2").val();

				var arr1 = aa.split('-');
				var arr2 = bb.split('-');

				//년                  월            일
				var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
				var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

				var diff = dat2 - dat1;
				var currday = 24 * 60 * 60 * 1000;

				var day = diff / currday; //일수차이
					
				if(day < 0){
					
					alert("예약일자가 바르지 않습니다.");
					$("#datepicker2").val("");
					
				}
				
	
							
			});				
			});		
		
				
	
			
		 // 시간이 -일때
		 
		 $(function() {  
				
		
			 $("#end_time").change( function() {
				
				 var aa = $("#datepicker").val();
					var bb = $("#datepicker2").val();

					var arr1 = aa.split('-');
					var arr2 = bb.split('-');

					//년                  월            일
					var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
					var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

					var diff = dat2 - dat1;
					var currday = 24 * 60 * 60 * 1000;

					var day = diff / currday; //일수차이
				 

					var a = $("#start_time").val();
					var b = $("#end_time").val();
					
					var ar1 = a.split(':');
					var ar2 = b.split(':');
					
					var time1 = ar1[0];
					var time2 = ar2[0];
					
					
					if(day == 0){
						
						if(time1 >= time2 ){
						alert("예약일자가 바르지 않습니다.");
						$("#end_time").val("");
						
						}
					}
			
			});
				
		 });		
	
		 
		
		 
		 
		 
		/*  $(function() { 	
		 	
		 if($("#start_time").val() || ("#start_time").val() || ("##datepicker2").val() == 0 ){
				$("#ttprice").val(0+"원");
		 };
		 }); */
						
//날짜 선택하는 동작.
	$(function() {

		$("#datepicker").datepicker(
				{
					inline : true,
					dateFormat : "yy-mm-dd", /* 날짜 포맷 */
					prevText : 'prev',
					nextText : 'next',
					changeMonth : true, /* 월 선택박스 사용 */
					changeYear : true, /* 년 선택박스 사용 */
					showOtherMonths : true, /* 이전/다음 달 일수 보이기 */
					selectOtherMonths : true, /* 이전/다음 달 일 선택하기 */
					buttonImageOnly : true,
					minDate : '-30y',
					closeText : '닫기',
					currentText : '오늘',
					showMonthAfterYear : true, /* 년과 달의 위치 바꾸기 */
					/* 한글화 */
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showAnim : 'slideDown',
					/* 날짜 유효성 체크 */
					onClose : function(selectedDate) {
						$('#fromDate').datepicker("option", "minDate",
								selectedDate);
					}
				});

		$("#datepicker2").datepicker(
				{

					inline : true,

					dateFormat : "yy-mm-dd", /* 날짜 포맷 */
					prevText : 'prev',
					nextText : 'next',
					changeMonth : true, /* 월 선택박스 사용 */
					changeYear : true, /* 년 선택박스 사용 */
					showOtherMonths : true, /* 이전/다음 달 일수 보이기 */
					selectOtherMonths : true, /* 이전/다음 달 일 선택하기 */

					buttonImageOnly : true,
					minDate : '-30y',
					closeText : '닫기',
					currentText : '오늘',
					showMonthAfterYear : true,

					numberOfMonths : 1,
					showMonthAfterYear : true,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showAnim : 'slideDown',

					onClose : function(selectedDate) {

						$("#from")
								.datepicker("option", "maxDate", selectedDate);

					}
				});
	});

	//빈칸을 모두 채웠는지 확인.
	function blank1() {

		var result = false;

		var b = document.getElementsByClassName("box"); //여기에서 바로 value를 써주지 마세요.

		for (var i = 0; i < b.length; i++) {
			if (b[i].value != "") {
				result = true;
			} else {
				result = false;
				break;
			}
		}
		if (result == false) {
			alert("양식을 모두 작성해주세요.");

		} else {
			alert("다음단계로 넘어갑니다.");
		}

		return result;

	}
	
</script>
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
		$("#_03").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_01").css("color", "#8877d5");
		$("#_03").css("color", "#8877d5");
		$("#_02").css("color", "white");
		$("#_03").click(function(){
			location.href="<%=application.getContextPath()%>/res/pick.jsp";
		});
		$("#_01").click(function(){
			location.href="<%=application.getContextPath()%>/res/price.jsp";
		});
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jspf" %>
<%@ include file="../temp/mHeader_01.jsp" %>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<form action="write.res" method="post">

	<input type="hidden" value="${member.id }" name="id">
		<div id="resv_area">
			<div style="margin-bottom: 15px;">
				<img src="../image/jy/h3_resv.jpg">
				<p class="tip">* 예약하실 룸을 먼저 선택해주세요.</p>
			</div>
			<div id="roomcheck">
				<label for="deluxeRoom" class="pri imgss"> <input class="catroom"
					type="radio" id="deluxeRoom" value="3000" name="room"> <span
					class="deluxe"></span>
				</label> 
				 <label for="sweetRoom" class="pri imgss"> <input class="catroom"
					type="radio" id="sweetRoom" value="2000" name="room"> <span
					class="sweet"></span>
				</label>
			</div>
	
			<div class="resv_wrap">
				<div class="cal_area">
					<div class="re_t">숙박기간</div>
					<div style="overflow: hidden;">
						<input class="box pri" type="text" name="start_day"  id="datepicker" placeholder="입실">
						<input class="box pri" type="text" name="last_day" id="datepicker2" placeholder="퇴실">

						<div id="calender">
							<%@ include file="./calender.jsp"%>
						</div>

					</div>
				</div>
				<div class="price_wrap">
					<div id="retime">
						<div class="re_t2">입실시간</div>
						<div class="re_t3">퇴실시간</div>
					</div>
					<div id="selecttime">
						<select class="box pri" name="start_time" id="start_time">
							<option value="">[옵션]시간을 선택해주세요.</option>
							<option value="10:00:00">오전 10시</option>
							<option value="11:00:00">오전 11시</option>
							<option value="12:00:00">오전 12시</option>
							<option value="13:00:00">오후 1시</option>
							<option value="14:00:00">오후 2시</option>
							<option value="15:00:00">오후 3시</option>
							<option value="16:00:00">오후 4시</option>
							<option value="17:00:00">오후 5시</option>
							<option value="18:00:00">오후 6시</option>
							<option value="19:00:00">오후 7시</option>
							<option value="20:00:00">오후 8시</option>
							<option value="21:00:00">오후 9시</option>
						</select> <select  class="box pri" name="end_time" id="end_time">
							<option value="">[옵션]시간을 선택해주세요.</option>
							<option value="10:00:00">오전 10시</option>
							<option value="11:00:00">오전 11시</option>
							<option value="12:00:00">오전 12시</option>
							<option value="13:00:00">오후 1시</option>
							<option value="14:00:00">오후 2시</option>
							<option value="15:00:00">오후 3시</option>
							<option value="16:00:00">오후 4시</option>
							<option value="17:00:00">오후 5시</option>
							<option value="18:00:00">오후 6시</option>
							<option value="19:00:00">오후 7시</option>
							<option value="20:00:00">오후 8시</option>
							<option value="21:00:00">오후 9시</option>

						</select>
					</div>

					<table class="price_table">
						<tr>
							<th>예약자명</th>
							<td><input class="box" name="r_name" id="r_name"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td id="ph"><input class="box" maxlength="3" name="ph1">-
									<input class="box" maxlength="4" name="ph2">-
									<input class="box" maxlength="4" name="ph3"></td>
						</tr>
						<tr id="myo1">
							<th>투숙 고양이수</th>
							<td><select class="box pri" name="catnum" id="catnum">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option class="myo2" value="3">3</option>
									<option class="myo2" value="4">4</option>
							</select></td>

						<tr>
							<th>가격</th>
							<td ><input type="text" id="ttprice" name="ttprice"></td>
						</tr>
					</table>

	
		
				</div>
			</div>
			
			<div id="subimg"><input id="k" type="image" src="../image/jy/btn_book.jpg" onclick="return blank1()" ></div>
		<p class="tip1">* 태어난 지 6개월 이상 중성화 수술을 하지 않은 아이의 경우 예약 전 전화상담 부탁 드립니다.</p>
		<p class="tip2"><img src="../image/jy/ico_tel.jpg"> 예약상담/문의 : 02-743-2459</p>
				</div>
		
	</form>
<%@ include file="../temp/footer.jspf"%>
</body>
</html>