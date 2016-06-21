<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:if test="${(member.id eq null) || (member.id ne 'admin')}">
	<script type="text/javascript">
		$(function() {
			alert("접근경로가 잘못되었습니다.");
			location.href="<%=application.getContextPath()%>/index.jsp";
		});
		
	</script>
</c:if>
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor", //textarea 랑 일치 시킬것
        sSkinURI: "../SE2/SmartEditor2Skin.html", // 경로명 일치
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    });
});
</script>
<script type="text/javascript">
	$(function() {
		$("#goList").click(function() {
			location.href="galHoList.gh?curPage=1"
		});
	});
	$(function() {
		$("#title2").text("Gallery");
		$("#_01").text("Hotel");
		$("#_02").text("Cats");
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
		$("#_01").css("color", "white");
		$("#_02").css("color", "#8877d5");
		$("#_01").click(function() {
			location.href="<%=application.getContextPath()%>/galHo/galHoList.gh?curPage=1"
			
		});
		$("#_02").click(function() {
			location.href="<%=application.getContextPath()%>/galCat/galCatList.gc?curPage=1"
			$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
			$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		});
	});
</script>
<style type="text/css">
	#galHo_wbody_h1{
		border-spacing: 0px;
		border-collapse: collapse;
	}
	input[type=text]{
		border: none;
		width: 100%;
		height: 40px;
		background-color: #f5f5f5;
	}
	#galHo_wbody, #galHo_wbody_h1{
		width: 1050px;
		margin: 0 auto;
	}
	.w{
		text-align: center;
		
	}
	#galHo_wbody_h1 td:nth-child(1),#galHo_wbody_h1 td:nth-child(2){
		border-top: 2px solid gray;
	}
	#galhowrite_btn{
		text-align: right;
		margin: 10px 0;
	}
	#galhowrite_btn input[type=button],#galhowrite_btn input[type=reset]{
		background-color: gray;
		color: white;
		font-weight:bolder;
		border-radius:7px;
		width: 80px;
		height: 30px;
	}
	#galHo_wbody{
		margin-top: 50px;
	}
</style>
</head>
<body>
	<!-- header -->
	<%@ include file="../temp/header.jspf" %>
	<!-- section -->
	<%@ include file="../temp/mHeader_02.jsp" %>
	<div id="galHo_wbody">
	<form action="galHoWrite.gh" method="post" id="frm">
		<div id="galHo_wbody_h">
			<table id="galHo_wbody_h1">
				<tr>
					<td class="w">제목</td> <td><input type="text" name="title"></td>
				</tr>
				<tr>	
					<td class="w">작성자</td><td><input type="text" name="id" value="${member.id }" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="contents" id="smarteditor" rows="10" cols="100" style="width:1040px; height:500px;"></textarea></td>
				</tr>
			</table>
		</div>
		<div id="galhowrite_btn">
			<input type="button" id="savebutton" value="완료">
			<input type="reset" value="다시쓰기">
			<input type="button" id="goList" value="목록으로">
		</div>
	</form>
		
	</div>
	<!-- footer -->
	<%@ include file="../temp/footer.jspf" %>
</body>
</html>