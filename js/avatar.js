document.addEventListener('DOMContentLoaded', function () {
    const avatarImg = document.getElementById('userAvatar');
    const avatarInput = document.getElementById('avatarUpload');

    // 页面加载时检查 localStorage 是否有头像数据
    const storedAvatar = localStorage.getItem('userAvatar');
    if (storedAvatar) {
        avatarImg.src = storedAvatar;
    }

    // 点击头像触发文件选择
    avatarImg.addEventListener('click', () => {
        avatarInput.click();
    });

    // 文件选择变化处理
    avatarInput.addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (!file) return;

        // 验证文件类型
        if (!file.type.startsWith('image/')) {
            alert('请选择图片文件');
            return;
        }

        const reader = new FileReader();
        reader.onload = function (event) {
            const avatarDataUrl = event.target.result;
            avatarImg.src = avatarDataUrl;
            localStorage.setItem('userAvatar', avatarDataUrl); // 存储到 localStorage
            alert('头像更新成功');
        };
        reader.readAsDataURL(file);
    });
});