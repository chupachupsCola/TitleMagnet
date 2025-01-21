<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>投稿の削除</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">投稿の削除</h1>

        <table class="table">
            <tr>
                <th>作品タイトル</th>
                <td><c:out value="${post.title}" /></td>
            </tr>
            <tr>
                <th>集名(表題)</th>
                <td><c:out value="${post.source}" /></td>
            </tr>
        </table>

        <!-- 削除確認フォーム -->
        <form action="" method="post">
            <div class="text-start">
                <button type="submit" class="btn btn-outline-secondary">削除</button>
                <a href="managePosts" class="btn btn-outline-secondary">キャンセル</a>
            </div>
        </form>
    </div>
</body>
</html>
