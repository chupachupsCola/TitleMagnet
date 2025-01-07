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
	<h1>投稿の承認</h1>
    <form action="" method="post">
        <table>
            <tr>
                <td>タイトル:</td>
                <td>
                    <input type="text" name="title" 
                           value="<c:out value="${!empty post ? post.title : (!empty inputs ? inputs.title : '')}" />">
                    <c:out value="${errors.title}" />
                </td>
            </tr>
            <tr>
                <td>出典作品名:</td>
                <td>
                    <input type="text" name="source" 
                           value="${!empty post ? post.source : (!empty inputs ? inputs.source : '')}">
                    <c:out value="${errors.source}" />
                </td>
            </tr>
            <tr>
                <td>著者名:</td>
                <td>
                    <input type="text" name="author" 
                           value="${!empty inputs ? inputs.author : ''}" />
                    <c:out value="${errors.author}" />
                </td>
            </tr>
            <tr>
                <td>出版社:</td>
                <td>
                    <input type="text" name="publisherName" 
                           value="${!empty inputs ? inputs.publisherName : ''}">
                    <c:out value="${errors.publisherName}" />
                </td>
            </tr>
            <tr>
                <td>URL:</td>
                <td>
                    <input type="text" name="url" 
                           value="${!empty inputs ? inputs.url : ''}">
                    <c:out value="${errors.url}" />
                </td>
            </tr>
        </table>
        <span><input type="submit" value="編集"></span>
        <span><a href="managePosts">戻る</a></span>
    </form>
</body>
</html>
