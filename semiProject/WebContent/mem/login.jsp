<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#login_01 {
		width: 1100px;
		height: 380px;
		margin: 0 auto;
		overflow: hidden;
		background-color: white;
	}
	#login_01_01 {
		width: 730px;
		height: 200px;
		margin: 0 auto;
	}
	#table {
		width: 560px;
		height: 80px;
		margin: 0 auto;
		margin-top: 25px;
	}
	#loCheck {
		width: 300px;
		height: 20px;
		margin-left: 100px;
		font-size: 12px;
		font-family: sans-serif;
		color: red;
		font-weight: bold;
	}
	#table table {
		width: 560px;
		height: 80px;
		border: 1px solid white;
		border-spacing: 0px;
		border-collapse: collapse;
		font-family: sans-serif;
		font-size: 12px;
		font-weight: bold;
		color: #333333;
		margin-top: 10px;
	}
	.text_01 {
		padding: 10px;
		color: #f2f2f2;
		background-color: #f2f2f2;
		border: 1px solid #cccccc;	
		color: black;
	}
	.td {
		text-align: center;
	}
	#pw {
		
	}
	#login_btn {
		width: 135px;
		height: 78px;
		border: 0px;
		background-image: url("/semiProject/image/hr/login_btn.jpg");
		cursor: pointer;
	}
	#text_02 {
		width: 205px;
		height: 25px;
		margin-left: 190px;
		margin-top: 10px;
		font-family: sans-serif;
		font-size: 12px;
	}
	#text_02_01 {
		border: 0px;
		background-color: white;
		font-family: sans-serif;
		font-size: 12px;
		cursor: pointer;
	}
	a:LINK {
    	text-decoration: none;
    	color: #333333;
	}
	a:HOVER {
		cursor: pointer;
		color: #333333;
	}
	a:VISITED {
		color: #333333;
	}
	#login_01_02 {
		width: 730px;
		height: 10px;
		margin: 0 auto;
	}
</style>


	<form action="<%=application.getContextPath() %>/mem/login.me" method="post">
		<div id="login_01">
			<div id="login_01_01">
				<hr style="border: 1px dotted #cccccc;">
				<div id="table">
					<div id="loCheck">
						<%-- ${message} --%>
					</div>
					<table border="1">
						<tr>
							<td>아이디</td> 
							<td class="td">
								<input type="text" class="text_01" name="id" style="width: 320px;">
							</td>
							<td rowspan="2">
								<button id="login_btn"></button>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td class="td">
								<input type="password" class="text_01" id="pw" name="pw" style="width: 320px;">
							</td>
						</tr>
					</table>
					<div id="text_02">
						* <input type="button" value="회원가입" id="text_02_01" data-toggle="modal" data-target="#myModal2" data-dismiss="modal"> *
					</div>
				</div>
			</div>
			<div id="login_01_02">
				<hr style="border: 1px dotted #cccccc;">
			</div>
		</div>
	</form>
