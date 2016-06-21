<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- ${pageContext.request.contextPath}/test2.jsp
	${pageContext.request.requestURI} --%>
	<c:choose>
		<c:when test="${pageContext.request.requestURI eq request.contextPath}/res/resWrite.jsp">
			
		</c:when>
		<c:when test="${pageContext.request.requestURI eq request.contextPath }/intro/service.jsp">
		
		</c:when>
		<c:otherwise>
			ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
		</c:otherwise>
	</c:choose>
	
	<%-- <%=request.getRequestURI() %> --%>
<%-- 	<c:choose>
		<c:when test="${sessionScope.member eq null}">
			<span value="회원가입" data-toggle="modal" data-target="#myModal2">Join</span>
		</c:when>
		<c:otherwise>
		<span value="마이페이지" >MyPage</span>
		</c:otherwise>
	
	</c:choose>
				 --%>		<%-- <c:if test="${sessionScope.member eq null} " >	
						joinjnjinjinjjn		
						<span value="회원가입" data-toggle="modal" data-target="#myModal2">Join</span>
						</c:if>
						<c:if test="${sessionScope.member ne null} " >
						opjopjiojijioijoji
						<span value="마이페이지" >MyPage</span>
						</c:if>				 --%>
</body>
</html>