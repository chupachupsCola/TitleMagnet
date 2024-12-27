<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%= request.getContextPath()
%>/css/style.css">
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