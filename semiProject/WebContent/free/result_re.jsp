<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%--  id : ${reply.id}
<input type="button" value="삭제" onclick="delete()">
<input type="button" value="수정" onclick="update()"><br>
contents : ${reply.contents}<br> 
 --%>

<tr><th>${reply.id}<p id="day">${i.reg_date}</p></th></tr>
<tr id="re_boder"><td><p >${reply.contents}</p>
<c:if test="${(member.id eq 'admin') || (member.id eq reply.id)  }">
<input type="button" value="삭제" onclick="delete()">
	<c:if test="${member.id eq reply.id }">
		<input type="button" value="수정" onclick="update()">
	</c:if>

</c:if>

</td></tr>


