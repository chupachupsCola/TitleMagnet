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
	<h1>投稿の削除</h1>
	<p>投稿の削除が完了しました。</p>
	<p><a href="managePosts">未承認の投稿一覧に戻る</a></p>
</body>
</html>