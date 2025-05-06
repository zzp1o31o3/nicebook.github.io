<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>书源广场</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/other-sources.css">
</head>
<body>
    <%@ include file="top-nav.jsp" %>
    
    <div class="source-container">
        <h2 class="section-title">📚 优质书源推荐</h2>
        
        <div class="source-list">
            <!-- 鸠摩搜索 -->
            <div class="source-card">
                <div class="source-info">
                    <span class="source-icon">🔍</span>
                    <span class="source-name">鸠摩搜索</span>
                </div>
                <a href="https://www.jiumodiary.com/" target="_blank" class="jump-btn">
                    立即跳转
                    <span class="link-arrow">→</span>
                </a>
            </div>
            <!--SoBooks -->
            <div class="source-card">
                <div class="source-info">
                    <span class="source-icon">🔍</span>
                    <span class="source-name">SoBooks</span>
                </div>
                <a href="https://sobooks.cc/" target="_blank" class="jump-btn">
                    立即跳转
                    <span class="link-arrow">→</span>
                </a>
            </div>
            <!-- 书伴 -->
            <div class="source-card">
                <div class="source-info">
                    <span class="source-icon">🔍</span>
                    <span class="source-name">书伴</span>
                </div>
                <a href="https://bookfere.com/" target="_blank" class="jump-btn">
                    立即跳转
                    <span class="link-arrow">→</span>
                </a>
            </div>
            <!-- 书格 -->
            <div class="source-card">
                <div class="source-info">
                    <span class="source-icon">🔍</span>
                    <span class="source-name">书格</span>
                </div>
                <a href="https://www.shuge.org/" target="_blank" class="jump-btn">
                    立即跳转
                    <span class="link-arrow">→</span>
                </a>
            </div>
            <!-- 书享家 -->
            <div class="source-card">
                <div class="source-info">
                    <span class="source-icon">🔍</span>
                    <span class="source-name">书享家</span>
                </div>
                <a href="https://www.shuxiangjia.cc/" target="_blank" class="jump-btn">
                    立即跳转
                    <span class="link-arrow">→</span>
                </a>
            </div>
            

           
        </div>
    </div>

    <%@ include file="bottom-nav.jsp" %>
    <script src="${pageContext.request.contextPath}/js/other-sources.js"></script>
</body>
</html>