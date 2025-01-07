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
	<h1>投稿の削除</h1>
	<table>
		<tr>
			<th>タイトル</th>
			<td><c:out value="${post.title}" /></td>
		</tr>
		<tr>
			<th>出典作品名</th>
			<td><c:out value="${post.source}" /></td>
		</tr>
	</table>
	<form action="" method="post">
		<span><input type="submit" value="削除"></span>
		<span><a href="managePosts">キャンセル</a></span>
	</form>
</body>
</html>