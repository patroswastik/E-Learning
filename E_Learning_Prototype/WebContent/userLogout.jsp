<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>
<%! int i; %>
<%
	Cookie ck[] = request.getCookies();
	for(i=0;i<ck.length;i++){
		if(ck[i].getName().equals("id")){
			ck[i].setMaxAge(0);
			response.addCookie(ck[i]);
		}
	}
%>
<jsp:forward page="userIndex.html"></jsp:forward>
</body>
</html>