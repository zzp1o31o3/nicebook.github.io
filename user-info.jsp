<%-- user-info.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" href="css/user-info.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/my-1.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/avatar.css">
</head>
<body>
    <%@ include file="top-nav.jsp" %>
    <div class="user-info-container" style="min-height: calc(100vh - 120px);">
        <!-- 头部渐变区域 -->
        <div class="profile-header" style="background: linear-gradient(135deg, #4CAF50, #45a049);">
            <div class="avatar-edit-section">
                <div class="avatar-preview">
                    <img id="userAvatar"src="images/zhuzi_1.jpg" class="user-avatar" alt="用户头像">
                      <input type="file" id="avatarUpload" accept="image/*">
                     <label class="camera-icon">📷</label>
                  
                </div>
            </div>
        </div>

        <form class="info-form" method="post" action="my">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" value="当前用户名" required>
            </div>
            
            <div class="form-group">
                <label>个性签名</label>
                <textarea name="signature" maxlength="50">这是我的个性签名</textarea>
            </div>

            <div class="form-group password-group">
                <label>修改密码</label>
                <input type="password" name="current-pwd" placeholder="当前密码">
                <input type="password" name="new-pwd" placeholder="新密码">
                <input type="password" name="confirm-pwd" placeholder="确认密码">
            </div>
            <button type="submit" class="save-btn" style="margin-bottom: 80px;">保存更改</button>
        </form>
    </div>

    <%@ include file="bottom-nav.jsp" %>
    <script src="${pageContext.request.contextPath}/js/user-info.js"></script>
    <script src="${pageContext.request.contextPath}/js/avatar.js"></script>
</body>
</html>