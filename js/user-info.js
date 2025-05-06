// user-info.js
document.addEventListener('DOMContentLoaded', () => {
    
 // 头像点击跳转
    document.querySelector('.avatar-preview').addEventListener('click', () => {
        window.open('my.jsp', 'avatarPicker', 'width=800,height=600');
 });
// 头像上传预览
    const avatarUpload = document.getElementById('avatar-upload');
    const avatarPreview = document.querySelector('.avatar-preview img');
    
    avatarUpload.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                avatarPreview.src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });

    // 密码修改验证
    const form = document.querySelector('.info-form');
    form.addEventListener('submit', function(e) {
        const newPwd = form.querySelector('input[name="new-pwd"]');
        const confirmPwd = form.querySelector('input[name="confirm-pwd"]');
        
        if (newPwd.value && newPwd.value !== confirmPwd.value) {
            e.preventDefault();
            alert('新密码与确认密码不一致！');
            confirmPwd.focus();
        }

  // 监听头像更新消息
    window.addEventListener('message', (e) => {
        if (e.origin !== window.origin) return;
        if (e.data.type === 'avatarUpdate') {
            document.querySelector('.user-avatar').src = e.data.payload;
            // 同步到表单隐藏域
            document.querySelector('#avatarUrl').value = e.data.payload;
        }
    });
});
 });
