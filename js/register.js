// 密码强度检测函数
function checkPasswordStrength(password) {
    const strength = {
        0: { text: '非常弱', color: '#ff4757' },
        1: { text: '弱', color: '#ff6b6b' },
        2: { text: '中等', color: '#ffa500' },
        3: { text: '强', color: '#4CAF50' }
    };

    let score = 0;
    if (password.length >= 8) score++;
    if (/[A-Z]/.test(password)) score++;
    if (/\d/.test(password)) score++;
    if (/[!@#$%^&*]/.test(password)) score++;

    return strength[Math.min(score, 3)];
}

// 实时表单验证
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('registerForm');
    const passwordInput = document.getElementById('password');
    const confirmInput = document.getElementById('confirmPassword');
    const strengthDisplay = document.getElementById('passwordStrength');

    // 密码输入实时检测
    passwordInput.addEventListener('input', function() {
        const strength = checkPasswordStrength(this.value);
        strengthDisplay.style.display = this.value ? 'block' : 'none';
        strengthDisplay.textContent = `密码强度：${strength.text}`;
        strengthDisplay.style.color = strength.color;
    });

    // 确认密码实时匹配
    confirmInput.addEventListener('input', checkPasswordMatch);
});

// 密码一致性检查
function checkPasswordMatch() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const confirmInput = document.getElementById('confirmPassword');

    if (confirmPassword && password !== confirmPassword) {
        confirmInput.setCustomValidity('两次输入的密码不一致');
        confirmInput.style.borderColor = '#ff4757';
    } else {
        confirmInput.setCustomValidity('');
        confirmInput.style.borderColor = '#e0e0e0';
    }
}

// 表单提交处理
document.getElementById('registerForm').addEventListener('submit', function(e) {
    if (!this.checkValidity()) {
        e.preventDefault();
        alert('请正确填写所有必填字段');
    }
});