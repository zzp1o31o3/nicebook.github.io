// readingTime.js
document.addEventListener('DOMContentLoaded', function() {
    // 初始化阅读时长
    let readingTime = 0;
    const readingTimeElement = document.querySelector('.reading-time span:last-child');
    
    // 从本地存储中加载阅读时长（如果存在）
    if (localStorage.getItem('readingTime')) {
        readingTime = parseInt(localStorage.getItem('readingTime'));
        updateReadingTimeDisplay();
    }
    
    // 开始计时
    const timer = setInterval(function() {
        readingTime++;
        updateReadingTimeDisplay();
        
        // 每分钟保存一次到本地存储
        if (readingTime % 60 === 0) {
            localStorage.setItem('readingTime', readingTime);
        }
    }, 1000);
    
    // 更新阅读时长显示
    function updateReadingTimeDisplay() {
        const minutes = Math.floor(readingTime / 60);
        const seconds = readingTime % 60;
        readingTimeElement.textContent = `阅读时长 ${minutes}分${seconds}秒`;
    }
    
    // 页面关闭时保存阅读时长
    window.addEventListener('beforeunload', function() {
        localStorage.setItem('readingTime', readingTime);
        clearInterval(timer);
    });

    // 在readingTime.js中更新进度
	function updateProgress(seconds) {
    const progressBar = document.querySelector('.bird-track');
    const indicator = document.querySelector('.poetic-indicator');
    const maxTime = 720000000000; // 2小时目标
    
    const progress = Math.min(seconds / maxTime, 1);
    progressBar.style.width = `${progress * 100}%`;
    
    // 文言文进度转换
    const chineseNumbers = ['〇','一','二','三','四','五','六','七','八','九','十'];
    const percent = Math.round(progress * 100);
    const text = `卷阅${chineseNumbers[Math.floor(percent/10)]}${chineseNumbers[percent%10]}成`;
    indicator.textContent = text;
    
    // 动态调整朝霞颜色
    const glow = document.querySelector('.dawn-glow');
    glow.style.background = `radial-gradient(circle at 65% 50%,
        rgba(253,${165 + percent},76,${0.1 + progress*0.2}),
        transparent 60%
    )`;
}
   
});