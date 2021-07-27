<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Occurred</title>
</head>
<body>
	<%! int i; %>
	<% 
		i = (int)request.getAttribute("error");
		if(i == 1){
	%>
		<h1>Invalid Credentials</h1>
	<%
		}else{
	%>
		<h1>Exception Occurred: <% request.getAttribute("exception"); %> </h1>
	<%
		}
	%>
	<h1><%=request.getAttribute("error") %></h1>
</body>
</html>