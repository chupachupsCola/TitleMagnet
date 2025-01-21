<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>投稿の管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
	<div class="container mt-5">
		<h1 class="text-center">投稿の管理</h1>
		<p><a href="logout" class="btn btn-light">ログアウト</a></p>
		<c:if test="${empty posts}">
			<div class="alert alert-info" role="alert">
				未承認の新規投稿はありません。
			</div>
		</c:if>
		<c:if test="${!empty posts}">
			<div class="card">
				<div class="card-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>新規投稿</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${posts}" var="post">
							<tr>
								<td>
									<p>
										<strong>作品タイトル:</strong> <c:out value="${post.title}" />
										<c:if test="${idList.contains(post.id)}">
											<span class="text-muted">※既に登録されています</span>
										</c:if>
									</p>
									<p>
										<strong>集名(表題):</strong> <c:out value="${post.source}" />
									</p>
								</td>
								<td>
									<c:if test="${!idList.contains(post.id)}">
										<a href="editPost?id=<c:out value="${post.id}" />" class="btn btn-outline-secondary btn-sm">編集</a>
									</c:if> 
									<a href="deletePost?id=<c:out value="${post.id}" />" class="btn btn-outline-secondary btn-sm">削除</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>
