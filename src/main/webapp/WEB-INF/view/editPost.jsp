<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>投稿の承認</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">投稿の承認</h1>

        <form action="" method="post">
            <!-- タイトル -->
            <div class="mb-3">
                <label for="title" class="form-label">タイトル:</label>
                <input type="text" id="title" name="title" class="form-control" 
                       value="<c:out value="${!empty post ? post.title : (!empty inputs ? inputs.title : '')}" />">
                <div class="text-danger"><c:out value="${errors.title}" /></div>
            </div>

            <!-- 出典作品名 -->
            <div class="mb-3">
                <label for="source" class="form-label">出典作品名:</label>
                <input type="text" id="source" name="source" class="form-control" 
                       value="${!empty post ? post.source : (!empty inputs ? inputs.source : '')}">
                <div class="text-danger"><c:out value="${errors.source}" /></div>
            </div>

            <!-- 著者名 -->
            <div class="mb-3">
                <label for="author" class="form-label">著者名:</label>
                <input type="text" id="author" name="author" class="form-control" 
                       value="${!empty inputs ? inputs.author : ''}" />
                <div class="text-danger"><c:out value="${errors.author}" /></div>
            </div>

            <!-- 出版社 -->
            <div class="mb-3">
                <label for="publisherName" class="form-label">出版社:</label>
                <input type="text" id="publisherName" name="publisherName" class="form-control" 
                       value="${!empty inputs ? inputs.publisherName : ''}">
                <div class="text-danger"><c:out value="${errors.publisherName}" /></div>
            </div>

            <!-- URL -->
            <div class="mb-3">
                <label for="url" class="form-label">URL:</label>
                <input type="text" id="url" name="url" class="form-control" 
                       value="${!empty inputs ? inputs.url : ''}">
                <div class="text-danger"><c:out value="${errors.url}" /></div>
            </div>
        <!-- フォーム外でボタンを配置 -->
        <div class="text-start">
            <button type="submit" class="btn btn-outline-secondary">編集</button>
            <a href="managePosts" class="btn btn-outline-secondary">戻る</a>
        </div>
        </form>

    </div>
</body>
</html>
