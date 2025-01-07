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
	<p><c:out value="${error}" /></p>
	<form action="" method="post">
		<p>
			<input type="text"	name="loginId" placeholder="ログインID" value="<c:out value="${loginId}" />">
			<c:out value="${errors.loginId}" />
		</p>
		<p>
			 <input type="passward" name="loginPass" placeholder="パスワード">
			 <c:out value="${errors.loginPass}" />
		</p>
		<input type="submit" value="ログイン">
	</form>
</body>
</html>