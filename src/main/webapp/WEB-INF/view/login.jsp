<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h1 class="text-center">管理者ログイン</h1>
				<p class="text-danger text-center"><c:out value="${error}" /></p>
				<p class="text-danger text-center"><c:out value="${errors.loginId}" /></p>
				<p class="text-danger text-center"><c:out value="${errors.loginPass}" /></p>
				<form action="" method="post">
					<div>
						<input type="text" name="loginId" id="loginId" class="form-control" placeholder="ログインID" value="<c:out value="${loginId}" />">
					</div>
					<div class="mb-3">
						<input type="password" name="loginPass" id="loginPass" class="form-control" placeholder="パスワード">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark w-100">ログイン</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
