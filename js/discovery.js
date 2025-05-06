document.addEventListener('DOMContentLoaded', function() {
    // ================= 优化后的轮播功能 =================
    const carousel = document.getElementById('imageCarousel');
    const items = document.querySelectorAll('.carousel-item');
    const prevBtn = document.querySelector('.prev-btn');
    const nextBtn = document.querySelector('.next-btn');
    let currentIndex = 0;
    let isAnimating = false;
    const autoPlayInterval = 5000; // 5秒自动轮播
    let autoPlayTimer;

    // 初始化轮播
    function initCarousel() {
        if(items.length > 0) {
            // 只显示第一张
            items[0].classList.add('active');
            startAutoPlay();
        }
    }

    // 切换幻灯片
    function goToSlide(index) {
        if(isAnimating) return;
        isAnimating = true;
        
        // 计算新索引
        currentIndex = (index + items.length) % items.length;
        
        // 淡出当前幻灯片
        const currentActive = document.querySelector('.carousel-item.active');
        currentActive.classList.remove('active');
        
        // 淡入新幻灯片
        setTimeout(() => {
            items[currentIndex].classList.add('active');
            isAnimating = false;
        }, 600);
        
        resetAutoPlay();
    }

    // 导航按钮事件
    prevBtn.addEventListener('click', () => goToSlide(currentIndex - 1));
    nextBtn.addEventListener('click', () => goToSlide(currentIndex + 1));

    // 自动轮播
    function startAutoPlay() {
        autoPlayTimer = setInterval(() => {
            goToSlide(currentIndex + 1);
        }, autoPlayInterval);
    }

    function resetAutoPlay() {
        clearInterval(autoPlayTimer);
        startAutoPlay();
    }

    // 鼠标悬停暂停
    carousel.addEventListener('mouseenter', () => clearInterval(autoPlayTimer));
    carousel.addEventListener('mouseleave', startAutoPlay);

    // 键盘导航
    document.addEventListener('keydown', (e) => {
        if(e.key === 'ArrowLeft') goToSlide(currentIndex - 1);
        if(e.key === 'ArrowRight') goToSlide(currentIndex + 1);
    });

    // ================= 互动按钮效果（保持不变） =================
    const interactionButtons = document.querySelectorAll('.interaction-btn');
    
    interactionButtons.forEach(button => {
        const initialCount = parseInt(button.getAttribute('data-initial'));
        const countEl = button.querySelector('.count');
        countEl.textContent = initialCount;
        
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            
            const ripple = document.createElement('span');
            ripple.classList.add('click-effect');
            this.appendChild(ripple);
            
            const rect = this.getBoundingClientRect();
            ripple.style.left = (e.clientX - rect.left - 5) + 'px';
            ripple.style.top = (e.clientY - rect.top - 5) + 'px';
            
            ripple.classList.add('active');
            
            setTimeout(() => {
                ripple.remove();
            }, 700);
            
            const isActive = this.classList.toggle('active');
            const countEl = this.querySelector('.count');
            let currentCount = parseInt(countEl.textContent);
            
            if(isActive) {
                animateCount(countEl, currentCount, currentCount + 1);
            } else {
                animateCount(countEl, currentCount, currentCount - 1);
            }
        });
        
        button.addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.1)';
            this.style.zIndex = '3';
        });
        
        button.addEventListener('mouseleave', function() {
            if(!this.classList.contains('active')) {
                this.style.transform = 'scale(1)';
                this.style.zIndex = '1';
            }
        });
    });

    function animateCount(element, start, end) {
        let current = start;
        const increment = end > start ? 1 : -1;
        const duration = 300;
        const stepTime = Math.abs(Math.floor(duration / (end - start)));
        
        const timer = setInterval(() => {
            current += increment;
            element.textContent = current;
            
            if (current === end) {
                clearInterval(timer);
            }
        }, stepTime);
    }

    // ================= 游戏板块功能（保持不变） =================
    const quoteData = [
        { text: "大胆一点" },
        { text: "结果可能让人惊讶"},
        { text: "毫无疑问"},
        { text: "会感到庆幸" },
        { text: "继续前进"},
        { text: "好运将会降临" },
        { text: "木已成舟" },
        { text: "时机未到" },
        { text: "相信你的直觉" },
        { text: "你心中已经有答案了" },
        { text: "有点耐心" },
        { text: "无法预测" },
        { text: "注意细节" },
        { text: "学会释然" },
        { text: "时间会证明一切" },
        { text: "如你所愿" },
        { text: "放手" },
        { text: "有可能" },
        { text: "障碍重重" },
        { text: "一笑了之" },
        { text: "全力以赴" },
        { text: "另有蹊跷" },
        { text: "你不止一个选择" },
        { text: "难以置信" },
        { text: "一步之遥" }
    ];


    document.getElementById('randomQuoteBtn').addEventListener('click', function() {
        const quoteText = document.querySelector('.quote-text');
        const quoteAuthor = document.querySelector('.quote-author');
        
        quoteAuthor.textContent = "";
        
        this.classList.add('clicked');
        setTimeout(() => {
            this.classList.remove('clicked');
        }, 300);
        
        setTimeout(() => {
            const randomQuote = quoteData[Math.floor(Math.random() * quoteData.length)];
            quoteText.textContent = randomQuote.text;
            quoteAuthor.textContent = "—— " + (randomQuote.author || "佚名");
            
            quoteText.style.animation = 'none';
            quoteAuthor.style.animation = 'none';
            setTimeout(() => {
                quoteText.style.animation = 'fadeIn 3s ease-out';
                quoteAuthor.style.animation = 'fadeIn 5s ease-out';
            }, 10);
        }, 500);
    });

    // ================= 滚动显示过渡效果（保持不变） =================
    const transitionElement = document.querySelector('.section-transition');
    const quoteSection = document.getElementById('quoteSection');
    
    function checkScroll() {
        const transitionPos = transitionElement.getBoundingClientRect().top;
        const windowHeight = window.innerHeight;
        
        if (transitionPos < windowHeight * 0.8) {
            transitionElement.classList.add('visible');
            quoteSection.classList.add('visible');
        }
    }
    
    window.addEventListener('scroll', checkScroll);
    window.addEventListener('resize', checkScroll);
    checkScroll();

    // 初始化
    initCarousel();
});