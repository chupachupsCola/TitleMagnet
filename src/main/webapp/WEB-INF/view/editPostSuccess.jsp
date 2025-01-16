<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>投稿承認完了</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <div class="container mt-5">
       <!-- メッセージ -->
        <div class="alert alert-light text-dark text-center" role="alert">
            投稿は正常に承認されました。
        </div>

        <!-- 次のアクションのリンク -->
        <div class="text-start">
            <a href="managePosts">未承認の投稿一覧に戻る</a>
        </div>
    </div>
</body>
</html>
