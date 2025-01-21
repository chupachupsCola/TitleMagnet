<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>TitleMagnet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <div class="container d-flex justify-content-center mt-5">
        <div class="w-50">
            <h1 class="text-center mb-4">投稿する</h1>
            <form action="" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">作品タイトル:</label>
                    <input type="text" class="form-control" name="title" id="title" value="<c:out value="${title}" />">
                    <div class="text-danger mt-2"><c:out value="${error}" /></div>
                </div>

                <div class="mb-3">
                    <label for="source" class="form-label">集名(表題):</label>
                    <input type="text" class="form-control" name="source" id="source" value="<c:out value="${source}" />" placeholder="投稿タイトルと一致する場合は、入力不要です。">
                </div>

                <!-- ボタンを左下に配置 -->
                <div class="d-flex justify-content-start mt-4">
                    <button type="submit" class="btn btn-outline-secondary">送信</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
