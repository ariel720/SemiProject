<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
<style type="text/css">
#relist{
margin: 0 auto;
width: 900px;
position: relative;
}
#relist_t1 {
	position: absolute;
	line-height: 36px;
	left: 10px;
	color: white;
	font-size: 14px;
}

#h3{
    margin-top: 20px;
    height: 30px;
    padding-bottom: 5px;
    font: bold 14px/30px '나눔고딕','맑은 고딕',serif;
    color: #444444;
    border-bottom: 1px solid #e9e9e9


}

td{

  border-bottom: 1px solid #e5e5e5;
    text-align: center;
    padding: 10px 0;


}
thead tr{
	   
	    display: table-row;
	    vertical-align: inherit;
	
}

table {
width: 900px;
font-size: 12px;
	    border-collapse: separate;
		border-spacing: 0;
		}

#tabletd td{

font: bold;
font-size: 12px;

}

</style>
</head>
<body>
<div id="relist">

<form action="myres.res">
	<table>
		<tr id="trhead" style="background: #f6f6f6;">
			<td>아이디</td>
			<td>이름</td>
			<td>연락처</td>
			<td>메일</td>
			<td>상세보기</td>
		</tr>
		<tr id="tabletd">
			<td>${mem.id }<input type="hidden" name="id" value="${mem.id }"></td>
			<td>${mem.name }</td>
			<td>${mem.phone_01 }-${mem.phone_02 }-${mem.phone_03 }</td>
			<td>${mem.email_01 }@${mem.email_02 }</td>
			<td><input type="submit" value="예약내역"></td>
		</tr>
	</table>
	
	</form>
	</div>
</body>
</html>