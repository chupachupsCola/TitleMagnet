<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ホームページ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
    <!-- カルーセル -->
    <div id="myCarousel" class="carousel slide mt-4" data-bs-ride="carousel">
        <div class="carousel-inner">
            <!-- 最初のスライド -->
            <c:forEach var="i" begin="0" end="7">
                <c:if test="${i % 4 == 0}">
                    <div class="carousel-item ${i == 0 ? 'active' : ''}">
                        <div class="row">
                </c:if>

                <!-- カード表示 -->
                <div class="col-6 col-md-3">
                    <div class="card">
                        <img src="https://source.unsplash.com/400x300?${i+1}" class="card-img-top" alt="画像">
                        <div class="card-body">
                            <h5 class="card-title">カードタイトル${i+1}</h5>
                            <p class="card-text">カード内容${i+1}の簡単な説明。</p>
                            <a href="#" class="btn btn-primary">詳細を見る</a>
                        </div>
                    </div>
                </div>

                <!-- 4つ目のアイテムを終わらせ、新しいスライドに移行 -->
                <c:if test="${i % 4 == 3 || i == 7}">
                    </div> <!-- .row -->
                    </div> <!-- .carousel-item -->
                </c:if>
            </c:forEach>
        </div>

        <!-- カルーセルのナビゲーション -->
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">前へ</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">次へ</span>
        </button>
    </div>
</body>
</html>
