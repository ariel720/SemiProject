
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
<c:choose>
	<c:when test="${member eq null }">
		<script type="text/javascript">
		$(function() {
			alert("접근경로가 잘못되었습니다.");
			location.href="<%=application.getContextPath()%>/index.jsp";
		});
		</script>
	</c:when>
</c:choose>
<style type="text/css">
	#d_01 {
		width: 1220px;
		height: 500px;
		margin: 0 auto;
		background-color: white;
		margin-top: 50px;
	}
	#d_01_01 {
		width: 900px;
		height: 36px;
		margin: 20px auto;
	}
	#table_info {
		width: 900px;
		height: 275px;
		margin: 15px auto;
		border: 1px solid white;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		font-weight: bold;
		color: #333333;
	}
	.text_info {
		padding: 10px;
		color: #f2f2f2;
		background-color: #f2f2f2;
		border: 1px solid #cccccc;	
		color: black;
	}
	#myLine {
		width: 900px;
		height: 2px;
		background-color: black;
		margin: 0 auto;
	}
	#updateBtn {
		width: 200px;
		height: 58px;
		background-image: url("/semiProject/image/hr/update.jpg");
		cursor: pointer;
		margin-top: 20px;
		margin-left: 495px;
		border: 0px;
	}
	#d_01_02 {
		text-align: right;
		margin-right: 158px;
	}
	#del_btn {
		width:100px;
		height:25px;
		font-size: 10px;
		font-family: sans-serif;
		color: black;
		border: 0px;
		border-radius: 5px;
		cursor: pointer;
	}
	#InSelect {
		color: gray;
		width: 90px;
		height: 25px;
	}
</style>

<%-- <c:if test="${member['id'] eq null}">
	<script type="text/javascript">
		$(function() {
			alert("접근경로가 잘못되었습니다.");
			location.href="<%=application.getContextPath()%>/index.jsp";
		});
		
	</script>
</c:if> --%>
<script type="text/javascript">
	$(function(){
		var d;
		var patt;
		var patt2;
		var patt3;
		var patt4;
		var r1;
		var r2;
		var r3;
		var r4;
		var r5;
		var r6;
		
		$("#myPw_01").blur(function(){
			d = document.getElementById("myPw_01");
			patt = /[0-9]+/; /* 0부터 9 사이에 반드시 '하나 또는 하나 이상'의 값을 가져야한다. */
			patt2 = /[a-z]+/; /* {3, 12} : 3개 이상, 12개 이하 */
			patt3 = /[A-Z]+/;
			patt4 = /[~, !, @, #, $, %, ^, &, *, _, +, =]+/;
			r1 = patt.test(d.value);
			r2 = patt2.test(d.value);
			r3 = patt3.test(d.value);
			r4 = d.value.length > 7;
			r5 = patt4.test(d.value);
			r6 = d.value.length < 17;
			
			if($(this).val() == ""){
				$("#myPwCheck_01").css("color", "red");
				$("#myPwCheck_01").text("비밀번호를 입력해주세요.");
			}else{
				if(r1 && r4 && r5 && r6){
					if(r2 || r3){
						$("#myPwCheck_01").css("color", "green");
						$("#myPwCheck_01").text("안전한 비밀번호입니다.");
					}else{
						$("#myPwCheck_01").css("color", "red");
						$("#myPwCheck_01").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.");
					}
				}else{
					$("#myPwCheck_01").css("color", "red");
					$("#myPwCheck_01").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.");
				}
			}
		});
		$("#myPw_02").blur(function(){
			if($(this).val() == ""){
				$("#myPwCheck_02").css("color", "red");
				$("#myPwCheck_02").text("비밀번호를 입력해주세요.");
			}else{
				if($("#myPw_02").val() != $("#myPw_01").val()){
					$("#myPwCheck_02").css("color", "red");
					$("#myPwCheck_02").html("비밀번호가 일치하지 않습니다.");
				}else{
					$("#myPwCheck_02").css("color", "green");
					$("#myPwCheck_02").html("비밀번호가 일치합니다.");
				}
			}
		});
		$("#em_01").blur(function(){
			if($(this).val() == ""){
				$("#eCheck").css("color", "red");
				$("#eCheck").text("이메일을 입력해주세요.");
			}else{
				$("#eCheck").text("");
			}
		});
		$("#em_02").blur(function(){
			if($(this).val() == ""){
				$("#eCheck").css("color", "red");
				$("#eCheck").text("이메일을 입력해주세요.");
			}else{
				$("#eCheck").text("");
			}
		});
		$("#ph_01").blur(function(){
			if($(this).val() == ""){
				$("#pCheck").css("color", "red");
				$("#pCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#pCheck").text("");
			}
		});
		$("#ph_02").blur(function(){
			if($(this).val() == ""){
				$("#pCheck").css("color", "red");
				$("#pCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#pCheck").text("");
			}
		});
		$("#ph_03").blur(function(){
			if($(this).val() == ""){
				$("#pCheck").css("color", "red");
				$("#pCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#pCheck").text("");
			}
		});
		$("#updateBtn").click(function(){	
			if($("#myPw_01").val() == "" || $("#myPw_02").val() == "" || $("#em_01").val() == "" || $("#em_02").val() == "" || $("#ph_01").val() == "" || $("#ph_02").val() == "" || $("#ph_03").val() == ""){
				alert("빈 칸을 모두 채워주세요.");
				return false;
			}else{
				if(r1 && r4 && r5 && r6){
					if(r2 || r3){
						if($("#myPw_02").val() == $("#myPw_01").val()){
							$("#frm").submit();
						}else{
							alert("비밀번호가 올바르게 설정되었는지 확인해주세요.");
							return false;
						}
					}else{
						alert("비밀번호가 올바르게 설정되었는지 확인해주세요.");
						return false;
					}
				}else{
					alert("비밀번호가 올바르게 설정되었는지 확인해주세요.");
					return false;
				}
			}
		});
		function b(){
			$("#em_02").val($("#InSelect").val());
		}
		$("#InSelect").change(b);
		
		$("#del_btn").click(function(){
			alert("정말로 탈퇴하시겠습니까?");
		});
	});
</script>

</head>
<body>

<%@ include file="../temp/header.jspf" %>
<script type="text/javascript">

$(function(){
	$("#title2m").text("My Page");
	$("#_01m").text("MY INFO");
	$("#_02m").text("MY RES");
	$("#_01m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_01m").css("color", "white");
	$("#_02m").css("color", "#8877d5");
	$("#_01m").click(function() {
		location.href="<%= application.getContextPath() %>/mem/myInfo.jsp";
		
	});
	$("#_02m").click(function() {
		location.href="<%= application.getContextPath() %>/res/list_m.res?cp=1";
		$("#_01m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_02m").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	});

});	

</script>
<%@ include file="../temp/myResHe.jsp" %>

	<div id="d_01">
		<div id="d_01_01">
			<img src="/semiProject/image/hr/myInfo_02.PNG">
		</div>
		<form action="Update.me" method="post" id="frm">
			<table id="table_info" border="1">
				<tr>
					<td>아이디</td>
					<td>${member.id}</td>
					<input type="hidden" name="id" value="${member.id}">
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" class="text_info" id="myPw_01" style="width: 400px;">
						&nbsp;<sapn id="myPwCheck_01"></sapn>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" class="text_info" id="myPw_02" name="pwCh" style="width: 400px;">
						&nbsp;<sapn id="myPwCheck_02"></sapn>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" class="text_info" id="em_01" name="emailCh_01" style="width: 240px;" value="${member.email_01 }"> @ 
						<input type="text" class="text_info" id="em_02" name="emailCh_02" style="width: 240px;" value="${member.email_02 }">&nbsp;|
						 <select id="InSelect">
		 				 	<option id="sel_01" value="">직접입력</option>
		 				 	<option id="sel_02" value="naver.com">naver.com</option>
		 				 	<option id="sel_03" value="daum.net">daum.net</option>
		 				 	<option id="sel_04" value="google.co.kr">google.co.kr</option>
		 				 </select>
						&nbsp;<sapn id="eCheck"></sapn>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" class="text_info" id="ph_01" name="phoneCh_01" style="width: 113px;" value="${member.phone_01 }"> - 
						<input type="text" class="text_info" id="ph_02" name="phoneCh_02" style="width: 113px;" value="${member.phone_02 }"> - 
						<input type="text" class="text_info" id="ph_03" name="phoneCh_03" style="width: 113px;" value="${member.phone_03 }">
						&nbsp;<sapn id="pCheck"></sapn>
					</td>
				</tr>
			</table>
			<div id="myLine"></div>
			<button id="updateBtn"></button>
			<div id="d_01_02">
				<form action="Delete.me" method="post">
					<button id="del_btn">회원탈퇴</button>
					<input type="hidden" name="id" value="${member.id}">
				</form>
			</div>
		</form>
	</div>
<%@ include file="../temp/footer.jspf" %>
</body>
</html>