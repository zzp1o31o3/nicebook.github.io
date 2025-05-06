<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户注册 - 每日好句</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
    <%@ include file="top-nav.jsp"%>
    
    <div class="auth-container">
        <div class="auth-card">
            <h2 class="auth-title">创建新账号</h2>
            <form id="registerForm" method="post" action="register" novalidate>
                <!-- 用户名输入 -->
                <div class="auth-input">
                    <label for="username">用户名</label>
                    <input type="text" 
                           id="username" 
                           name="username" 
                           required
                           pattern="[A-Za-z0-9]{4,20}"
                           title="4-20位字母或数字">
                </div>

                <!-- 密码输入 -->
                <div class="auth-input">
                    <label for="password">密码</label>
                    <input type="password" 
                           id="password" 
                           name="password" 
                           required
                           pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                           title="至少8位，包含字母和数字">
                    <div class="password-strength" id="passwordStrength"></div>
                </div>

                <!-- 确认密码 -->
                <div class="auth-input">
                    <label for="confirmPassword">确认密码</label>
                    <input type="password" 
                           id="confirmPassword" 
                           required
                           oninput="checkPasswordMatch()">
                </div>

                <button type="submit" class="auth-submit">立即注册</button>
                
                <div class="auth-links">
                    <span>已有账号？</span>
                    <a href="login.jsp" class="auth-link">立即登录</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="bottom-nav.jsp" %>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>