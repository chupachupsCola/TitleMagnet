<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
	<form action="" method="post">
		<p>タイトル:
			<input type="text" name="title" ><c:out value="${error}" />
		</p>
		<p>出典作品名:
			<input type="text" name="source" value="<c:out value="${source}" />">
		</p>
		<p>
			<input type="submit" value="送信">
		</p>
	</form>
</body>
</html>