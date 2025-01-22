<%@ page pageEncoding="UTF-8" %>
<!-- ナビゲーションバー -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/home">TitleMagnet</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("/home.jsp") ? "active" : "" %>" aria-current="page" href="<%= request.getContextPath() %>/home">トップページ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("/post.jsp") ? "active" : "" %>" href="<%= request.getContextPath() %>/post">投稿する</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
