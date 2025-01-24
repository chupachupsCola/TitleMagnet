<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 複数のカルーセル -->
    <c:forEach var="carouselIndex" begin="1" end="${approvedPosts.size()}">
        <div id="carousel${carouselIndex}" class="carousel slide mt-4" data-bs-ride="carousel">
            <div class="carousel-inner">
                <c:set var="startIndex" value="${(carouselIndex - 1) * 8}" />
                <c:set var="endIndex" value="${carouselIndex * 8}" />

                <c:forEach var="post" items="${approvedPosts}" varStatus="status">
                    <c:if test="${status.index >= startIndex && status.index < endIndex}">
                        <c:choose>
                            <c:when test="${(status.index - startIndex) % 4 == 0}">
                                <div class="carousel-item ${status.index == startIndex ? 'active' : ''}">
                                    <div class="row">
                            </c:when>
                        </c:choose>

                        <div class="col-6 col-md-3">
                            <div class="card" style="height: 130px; object-fit: cover;">
                                <div class="card-body position-relative">
                                    <h5 class="card-title">
                                    	<c:if test="${!empty post.title}"><c:out value="${post.title}" /></c:if>
                        				<c:if test="${empty post.title}"><c:out value="${post.source}" /></c:if>
                                    </h5>
                                    <button 
                                        type="button" 
                                        class="btn btn-outline-secondary position-absolute bottom-0 mb-2" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#postModal${status.index}">
                                        詳細を見る
                                    </button>
                                </div>
                            </div>
                        </div>

                        <c:choose>
                            <c:when test="${(status.index - startIndex + 1) % 4 == 0 || status.index == endIndex - 1}">
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#carousel${carouselIndex}" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">前へ</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carousel${carouselIndex}" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">次へ</span>
            </button>
        </div>
    </c:forEach>

    <!-- モーダル -->
    <c:forEach var="post" items="${approvedPosts}" varStatus="status">
        <div class="modal fade" id="postModal${status.index}" tabindex="-1" aria-labelledby="postModalLabel${status.index}" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <p><a href="${post.url}" target="_blank" class="btn btn-outline-secondary"><img src="${post.imageUrl}" class="img-fluid mb-3" alt="${post.title}"></a></p>
                        <h5 class="modal-title" id="postModalLabel${status.index}">
                        	<c:if test="${!empty post.title}"><c:out value="${post.title}" /></c:if>
                        	<c:if test="${empty post.title}"><c:out value="${post.source}" /></c:if>
                        </h5>
                    </div>
                    <div class="modal-body"> 
                    	<c:if test="${!empty post.source}">
                    	<p><strong>表題 : </strong><c:out value="${post.source}" /></p>
                    	</c:if>  	
                    	<c:if test="${empty post.source}">
                    	<p><strong>表題 : </strong><c:out value="${post.title}" /></p>
                    	</c:if>  	
                    	<p><strong>著者 : </strong><c:out value="${post.author}" /></p>
                    	<p><strong>出版社 : </strong><c:out value="${post.publisherName}" /></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">閉じる</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <style>
    .card-body button {
        z-index: 1050;
        position: relative;
    }

    .carousel-control-prev,
    .carousel-control-next {
        z-index: 1000;
    }
    
    .modal-header {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .modal-header img {
        max-width: 100%;
        height: auto;
    }   
</style>
</body>
</html>
