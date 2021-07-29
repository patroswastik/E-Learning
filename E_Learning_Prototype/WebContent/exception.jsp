<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<script>
	function goBack() {
		window.history.back();
	}
	</script>
	<%! String message; %>
	<% message = (String)request.getAttribute("message"); %>
	<h1>Exception: <%=message %></h1>
	<button onclick="goBack()">Go Back</button>
</body>
</html>