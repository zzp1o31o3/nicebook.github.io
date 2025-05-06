// 添加书源卡片悬停效果
document.querySelectorAll('.source-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        card.style.transform = 'translateY(-2px)';
        card.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
    });
    
    card.addEventListener('mouseleave', () => {
        card.style.transform = 'none';
        card.style.boxShadow = 'none';
    });
});