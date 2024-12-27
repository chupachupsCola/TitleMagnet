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
	<h1>投稿の管理</h1>
	<p><a href="logout">ログアウト</a></p>
	<table border="1">
		<tr>
			<th>新規投稿</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${posts}" var="post">
		<tr>
			<td>
				<p>タイトル:
					<c:out value="${post.title}" />
					
					<c:forEach items="${idList}" var="id">
					<c:if test="${id == post.id}">
					<span>※既に登録されています</span>
					</c:if>
					</c:forEach>
				</p>
				<p>出典作品名:
					<c:out value="${post.source}" />
				</p>
			</td>
			<td>
				<c:forEach items="${idList}" var="id">
				<c:if test="${id != post.id}">
				<a href="editPost?id=<c:out value="${post.id}" />">編集</a>
				</c:if>
				</c:forEach>
				<a href="deletePost?id=<c:out value="${post.id}" />">削除</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>