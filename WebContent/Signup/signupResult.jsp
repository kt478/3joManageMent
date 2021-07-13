<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<%if(user_id == null){ %>
<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
<%}else{%>
<script type="text/javascript">
alert("찾으시는 계정은 <%=user_id%>입니다.");
location.href="login1.jsp";
</script>
<%}%>


</body>
</html> --%>