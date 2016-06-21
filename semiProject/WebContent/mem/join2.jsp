<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		
		//빈칸이 있을 시 채우라는 명령어
		var check = false;
		
		var i;
		var patti;
		var ri;
		
		$("#id").blur(function(){
			i = document.getElementById("id");
			patti = /[\s]+/;
			ri = patti.test(i.value);
			if($(this).val() == ""){
				$("#idCheckText").css("color", "red");
				$("#idCheckText").text("아이디를 입력해주세요.");
			}else{
				$("#idCheckText").text("");
				
				$("#idCheck").click(function(){
					var id = $("#id").val();
					
					$.post("<%=application.getContextPath()%>/mem/IdCheck.me", 
						{
							id:id
						}, 
						function(data){ 
							data= data.trim();
							
							if(data == 'ok'){ //trim() : 문자열의 모든 공백제거
								if($("#id").val() != ""){
									if(!ri){
										$("#idHi").val($("#id").val());
										$("#idCheckText").css("color", "green");
										$("#idCheckText").text("사용가능한 아이디 입니다.");
										check = true;
									}else{
										$("#idCheckText").css("color", "red");
										$("#idCheckText").text("올바른 아이디가 아닙니다.");
										check = false;
									}
								}else{
									$("#idCheckText").css("color", "red");
									$("#idCheckText").text("아이디를 입력해주세요.");
									check = false;
								}
							}else{
								$("#idCheckText").css("color", "red");
								$("#idCheckText").text("중복된 아이디 입니다."); //value에 있는 값을 제거
								$("#id").val("");
								check = false;
							}
						});
						return check;
				});
			}
		});
		
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
		
		$("#pw_01").blur(function(){
			d = document.getElementById("pw_01");
			patt = /[0-9]+/; /* 0부터 9 사이에 반드시 '하나 또는 하나 이상'의 값을 가져야한다. */
			patt2 = /[a-z]+/; /* {3, 12} : 3개 이상, 12개 이하 */
			patt3 = /[A-Z]+/;
			patt4 = /[~,!,@,#,$,%,^,&,*,_,+,=]+/;
			patt5 = /[\s]+/;
			r1 = patt.test(d.value);
			r2 = patt2.test(d.value);
			r3 = patt3.test(d.value);
			r4 = d.value.length > 7;
			r5 = patt4.test(d.value);
			r6 = d.value.length < 17;
			r7 = patt5.test(d.value);
			
			if($(this).val() == ""){
				$("#pwCheckText").css("color", "red");
				$("#pwCheckText").text("비밀번호를 입력해주세요.");
			}else{
				if(r1 && r4 && r5 && r6 && !r7){
					if(r2 || r3){
						$("#pwCheckText").css("color", "green");
						$("#pwCheckText").text("안전한 비밀번호입니다.");
					}else{
						$("#pwCheckText").css("color", "red");
						$("#pwCheckText").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.");
					}
				}else{
					$("#pwCheckText").css("color", "red");
					$("#pwCheckText").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.");
				}
			}
		});
		$("#pw_02").blur(function(){
			if($(this).val() == ""){
				$("#pwCheck").css("color", "red");
				$("#pwCheck").text("비밀번호를 입력해주세요.");
			}else{
				if($("#pw_02").val() != $("#pw_01").val()){
					$("#pwCheck").css("color", "red");
					$("#pwCheck").html("비밀번호가 일치하지 않습니다.");
				}else{
					$("#pwCheck").css("color", "green");
					$("#pwCheck").html("비밀번호가 일치합니다.");
				}
			}
		});
		$("#name").blur(function(){
			if($(this).val() == ""){
				$("#nameCheck").css("color", "red");
				$("#nameCheck").text("이름을 입력해주세요.");
			}else{
				$("#nameCheck").text("");
			}
		});
		$("#e_01").blur(function(){
			if($(this).val() == ""){
				$("#emailCheck").css("color", "red");
				$("#emailCheck").text("이메일을 입력해주세요.");
			}else{
				$("#emailCheck").text("");
			}
		});
		$("#e_020").blur(function(){
			if($(this).val() == ""){
				$("#emailCheck").css("color", "red");
				$("#emailCheck").text("이메일을 입력해주세요.");
			}else{
				$("#emailCheck").text("");
			}
		});
		$("#p_01").blur(function(){
			if($(this).val() == ""){
				$("#phoneCheck").css("color", "red");
				$("#phoneCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#phoneCheck").text("");
			}
		});
		$("#p_02").blur(function(){
			if($(this).val() == ""){
				$("#phoneCheck").css("color", "red");
				$("#phoneCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#phoneCheck").text("");
			}
		});
		$("#p_03").blur(function(){
			if($(this).val() == ""){
				$("#phoneCheck").css("color", "red");
				$("#phoneCheck").text("휴대폰 번호를 입력해주세요.");
			}else{
				$("#phoneCheck").text("");
			}
		});
		$("#button_011").click(function(){	
			if($("#id").val() == "" || $("#pw_01").val() == "" || $("#pw_02").val() == "" || $("#name").val() == "" || $("#e_01").val() == "" || $("#e_020").val() == "" || $("#p_01").val() == "" || $("#p_02").val() == "" || $("#p_03").val() == ""){
				alert("빈 칸을 모두 채워주세요.");
				return false;
			}else{
				if(!ri){
					if(check){
						if($("#idHi").val() == $("#id").val()){
							if(r1 && r4 && r5 && r6 && !r7){
								if(r2 || r3){
									if($("#pw_02").val() == $("#pw_01").val()){
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
						}else{
							alert("아이디 중복확인을 해주세요.");
							return false;
						}
					}else{
						alert("아이디 중복확인을 해주세요.");
						return false;
					}
				}else{
					alert("아이디가 올바르게 작성되었는지 확인해주세요.");
					return false;
				}
			}
		});
		
		function a(){
			$("#e_020").val($("#join2Select").val());
			/* alert($("#e_02").val($("#join2Select").val())); */
		} 
		$("#join2Select").change(a);
	
	});
	
	
</script>

<style type="text/css">
	#table_d	{
		width: 1100px;
		height: 480px;
		margin: 0 auto;
		margin-bottom: 40px;
		background-color: white;
	}
	#join2_ta {
		width: 900px;
		height: 330px;
		border: 1px solid white;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		font-weight: bold;
		color: #333333;
		margin: 0 auto;
	}
	#id {
		width: 317px;
	}
	#pw_01 {
		width: 400px;
	}
	#pw_02 {
		width: 400px;
	}
	#name {
		width: 400px;
	}
	#e_01 {
		width: 200px;
	}
	#e_020 {
		width: 200px;
	}
	#join2Select {
		color: gray;
		width: 90px;
		height: 25px;
	}
	#p_01 {
		width: 123px;
	}
	#p_02 {
		width: 123px;
	}
	#p_03 {
		width: 123px;
	}
	.text2 {
		padding: 10px;
		color: #f2f2f2;
		background-color: #f2f2f2;
		border: 1px solid #cccccc;	
		color: black;
	}
	#idCheck {
		width: 120px;
		height: 39px;
		border: 0px;
		background-image: url("/semiProject/image/hr/btn_idcheck.jpg");
		padding: 14px;
		cursor: pointer;
	}
	#button2	{
		width: 900px;
		height: 100px;
		margin-top: 40px;
	}
	#button_011 {
		width: 200px;
		height: 58px;
		border: 0px;
		background-image: url("/semiProject/image/hr/btn_signsuccess.jpg");
		margin-top: 30px;
		cursor: pointer;
	}
	#button_023 {
		width: 150px;
		height: 58px;
		border: 0px;
		margin-left: 20px;
		background-image: url("/semiProject/image/hr/btn_prev.jpg");
		margin-top: 30px;
		cursor: pointer;
	}
</style>
	<script type="text/javascript">
		$(function(){
			$("#title").text('Member');
			$("#title").css("margin-left", "452px");
			$("#modal_04").html('<img src="/semiProject/image/hr/join2_01.PNG">');
			$("#modal_04").css("width", "900px");
			$("#modal_04").css("height", "36px");
			$("#close").html('<img src="/semiProject/image/hr/modal_close.jpg">');
			$("#close").css("cursor", "pointer");
		});
		
		$(function() {
			$("#button_023").click(function(){
				 $.ajax({url:"<%=application.getContextPath()%>/mem/join.jsp",
						type:"POST",
						success: function(result) {
							result = result.trim();
							$("#come").html(result);
						}				
				});
			});
		});
	</script>

	<form action="<%=application.getContextPath() %>/mem/Join.me" method="post" id="frm">
		<div id="table_d">
			<table id="join2_ta">
				<tr>
					<td>
		 				아이디
		 			</td>
		 			<td>
		 				<input type="hidden" id="idHi">
		 				<input class="text2" type="text" name="id" id="id">&nbsp;&nbsp;
		 				<input type="button" id="idCheck">
		 				&nbsp;<span id="idCheckText"></sapn>
		 			</td>
		 		</tr>
		 		<tr>
					<td>
		 				비밀번호
		 			</td>
		 			<td>
		 				<input class="text2" type="password" id="pw_01">
		 				&nbsp;<span id="pwCheckText"></span>
		 			</td>
		 		</tr>
		 		<tr>
					<td>
		 				비밀번호 확인
		 			</td>
		 			<td>
		 				<input class="text2" type="password" id="pw_02" name="pw">
		 				&nbsp;<span id="pwCheck"></span>
		 			</td>
		 		</tr>
		 		<tr>
					<td>
		 				이름
		 			</td>
		 			<td>
		 				<input class="text2" type="text" id="name" name="name">
		 				&nbsp;<span id="nameCheck"></span>
		 			</td>
		 		</tr>
		 		<tr>
					<td>
		 				이메일
		 			</td>
		 			<td>
		 				<input class="text2" type="text" id="e_01" name="email_01"> @
		 				 <input class="text2" type="text" id="e_020" name="email_02">&nbsp;|
		 				 <select id="join2Select">
		 				 	<option value="">직접입력</option>
		 				 	<option value="naver.com">naver.com</option>
		 				 	<option value="daum.net">daum.net</option>
		 				 	<option value="google.co.kr">google.co.kr</option>
		 				 </select>
		 				 &nbsp;<span id="emailCheck"></span>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				휴대폰
		 			</td>
		 			<td>
		 				<input class="text2" type="text" id="p_01" name="phone_01" maxlength="3"> -
				 		 <input class="text2" type="text" id="p_02" name="phone_02" maxlength="4"> -
				 		 <input class="text2" type="text" id="p_03" name="phone_03" maxlength="4">
				 		 &nbsp;<span id="phoneCheck"></span>
		 			</td>
		 		</tr>
		 	</table>
		 	<center>
			 	<div id="button2">
			 		<hr style="border: 1px dotted #cccccc;">
			 		<input type="button" id="button_011">
			 		<input id="button_023" type="button">
			 	</div>
		 	</center>
		</div>
	</form>
