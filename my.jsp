<%-- my.jsp --%>
<%-- 个人中心主界面 --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my-1.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/avatar.css">
</head>
<body>
  <div class="ink-wash-bg"></div>
    <div class="content-wrapper">
    <%@ include file="top-nav.jsp" %>
    
   <div class="profile-container" style="background-image:url('images/avatar/touxiang.jpg')">
        <!-- 头部渐变区域 -->
       
<div class="profile-header" style="background-image:url('images/beijing.jpg')" >
    <div class="header-bg"></div> <!-- 新增背景容器 -->
    <div class="avatar-section">
        <img id="userAvatar"  src=" images/avatar/touxiang.jpg" class="user-avatar" alt="头像">
        <a href="login.jsp" class="auth-link">注册/登录</a>
        <input type="file" id="avatarUpload" accept="image/*">
    </div>
</div>
      
        <!-- 功能列表 -->
        <ul class="function-list">
            
            <li class="list-item">
            
                <span class="item-icon">&#128216;</span>
                <span class="item-text">我的收藏</span>
                <span class="share-loader"class="auth-link">&gt;</span>
            </li>
            <li class="list-item">
                <span class="item-icon">👤</span>
                <a href="user-info.jsp" class="item-text">用户信息</a>
                 <span class="share-loader">&gt;</span>
            </li>
            <%-- 修改功能列表项，添加点击事件 --%>
            <li class="list-item">
                 <span class="item-icon">&#128221;</span>
                 <a href="https://docs.qq.com/sheet/DSG13dFRkSXhPQ0xL?nlc=1&tab=BB08J2" class="item-text">我要反馈</a>
                  <span class="share-loader">&gt;</span>
           </li>
                         
            <li class="list-item share-item">
                <span class="item-icon">🌐</span>
                <a href="${pageContext.request.contextPath}/other-sources.jsp" class="item-text">其它书源</a>
                <span class="share-loader">&gt;</span>
            </li>
           <!--  <li class="list-item">
                <span class="item-icon">&#127769;</span>
                <a class="item-text"></a>
                <span class="share-loader">&gt;</span>
                <label class="switch">
                   <input type="checkbox" >
                    <span class="slider"></span>
                </label>
            </li> -->
             <li class="list-item">
            
                <span class="item-icon"></span>
                <span class="item-text"></span>
                <span class="share-loader"class="auth-link"></span>
            </li>
             <li class="list-item">
            
                <span class="item-icon"></span>
                <span class="item-text"></span>
                <span class="share-loader"class="auth-link"></span>
            </li>
             <li class="list-item">
            
                <span class="item-icon"></span>
                <span class="item-text"></span>
                <span class="share-loader"class="auth-link"></span>
            </li>
              <li class="list-item">
            
                <span class="item-icon"></span>
                <span class="item-text"></span>
                <span class="share-loader"class="auth-link"></span>
            </li>
             <li class="list-item">
            
                <span class="item-icon"></span>
                <span class="item-text"></span>
                <span class="share-loader"class="auth-link"></span>
            </li>
        </ul>
    </div>
    
    <%@ include file="bottom-nav.jsp" %>
    <script src="js/readingTime.js"></script>
    <script src="${pageContext.request.contextPath}/js/avatar.js"></script>
  </div>
   
</body>
</html>