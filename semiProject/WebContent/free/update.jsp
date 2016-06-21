<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=application.getContextPath() %>/css/freeuptate.css" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<c:if test="${member.id eq null }">
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
        elPlaceHolder: "smarteditor", //textarea 아이디와 반드시 같게하기.
        sSkinURI: "../SE2/SmartEditor2Skin.html", //현재 파일의 위치와 잘 비교해서 작성하세요.
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
    })
})



</script>
<style type="text/css">
/* #t1{
width: 100%;
font-size: small;
border-spacing: 0;
border-collapse: 0;
border: 2px solid;

}

#write_table{
width: 900px;
margin: 0 auto;
margin-top: 100px;


}

#write_table th{

text-align: center;
background: #f7f8f9;

}

#td2{
width:99.5%;


}

#td1{
border: none;
background: #f7f8f9;
font-size: 12px;


}

.tr1{
height: 35px;
background: #f7f8f9;
}

#button_div{
text-align: center;
margin-top: 20px;

}

.but{

    background-color: #2daebf;
    font-size: 14px;
    padding: 8px 14px 9px;
  	cursor: pointer;
    font-weight: bold;
    -webkit-border-radius: 5px;
    color: #fff;
	border-color: #2daebf;

}

 */

</style>
</head>
<body>

<%@ include file="../temp/header.jspf" %>
<script type="text/javascript">

$(function(){
	$("#title2").text("Board");
	$("#_01").text("Notice Board");
	$("#_02").text("Free Board");
	$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
	$("#_02").css("color", "white");
	$("#_01").css("color", "#8877d5");
	$("#_01").click(function() {
		location.href="<%=application.getContextPath()%>/notice/list.nt?cp=1";
		$("#_01").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn.jpg')");
		$("#_02").css("background-image", "url('<%= application.getContextPath() %>/image/hr/modal_btn2.jpg')");
	});
	$("#_02").click(function() {
		location.href="<%=application.getContextPath()%>/free/list.fr?cp=1";
		
	});

});	

</script>
<!-- ==============HEADER================= -->
<%@ include file="../temp/mHeader_02.jsp" %>

<div id="w_change">
<form action="update.fr" method="post" id="frm">
<div id="write_table">
<table id="t1">

<%-- <tr><td>작성자</td><td><input type="text" name="id" readonly="readonly">${sessionScop.member.id}</td></tr> --%>
<colgroup>
<col width="12%">
<col width="88%">
</colgroup>
<input type="hidden" value="${fr.num }"  name="num">
<tr class="tr1"><th>작성자</th><td ><input id="td1" type="text" name="id" readonly="readonly" value="${fr.id}"></td></tr>
<tr class="tr1"><th>제목</th><td ><input id="td2" type="text" name="title" value="${fr.title }">
	<input type="hidden" value="${fr.counts }" name="counts" > 
</td></tr>
<tr><th>내용</th><td><textarea name="smarteditor" id="smarteditor" rows="10" cols="60" style="width:100%; height:412px;">${fr.contents }</textarea></td></tr>

</table>
<div id="button_div">
<input class="but" type="submit" id="savebutton" value="확인" />
<input class="but" type="reset" value="다시쓰기">
</div>
</div>
</form>
</div>

</head>
<%@ include file="../temp/footer.jspf" %>

</body>
</html>