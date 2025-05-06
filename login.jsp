<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<title>注册/登录</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"> 
</head>
<body>
<%@ include file="top-nav.jsp"%>
<div class="auth-container">
        <div class="auth-card">
            <h2 class="auth-title">用户登录</h2>
            <form method="post" action="login">
                <div class="auth-input">
                    <label>用户名</label>
                    <input type="text" name="username" required>
                </div>
                <div class="auth-input">
                    <label>密码</label>
                    <input type="password" name="password" 
                           pattern="^[A-Za-z0-9]+$" 
                           title="密码只能包含英文和数字" required>
                </div>
                <button type="submit" class="auth-submit">立即登录</button>
                <div class="auth-links">
                    <a href="register.jsp" class="auth-link">注册账号</a>
                    <span style="color:#ccc">|</span>
                    <a href="#" class="auth-link">忘记密码？</a>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="bottom-nav.jsp" %>
</body>
</html>