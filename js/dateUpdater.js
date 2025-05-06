// 在dateUpdater.js中添加以下代码
const bgManager = (() => {
    const bgData = [
        { 
            img: 'images/ofindex/1.jpg',
            quote: '"山林不向四季起誓，荣枯随缘"',
            author: '——简媜《海誓》'
        },
        {
            img: 'images/ofindex/2.jpg',
            quote: '"且将新火试新茶，诗酒趁年华"',
            author: '——苏轼《望江南》'
        },
		{ 
            img: 'images/ofindex/3.jpg',
            quote: '"有人会喜欢孤独，只是不喜欢失望罢了。"',
            author: '——村上春树《挪威的森林》'
        },
		{ 
            img: 'images/ofindex/4.jpg',
            quote: '"我终于肯定我所怀念的，不是那些终将逝去的东西，而是清晨鸟鸣时那种宁静。"',
            author: ' ——罗伯特潘沃伦'
        },
		{ 
            img: 'images/ofindex/5.jpg',
            quote: '"历经万般红尘劫，犹如凉风轻拂面。"',
            author: ' --林清玄 '
        },
		{ 
            img: 'images/ofindex/6.jpg',
            quote: '"凡是过去，皆为序章。"',
            author: ' ——莎士比亚 '
        },
        {
            img: 'images/ofindex/7.jpg',
            quote: '"你是呼吸，是床头， 是陪伴星星的夜晚。"',
            author: ' ——北岛《一束》'
        }

    ];

    let currentIndex = 0;
    const container = document.createElement('div');
    container.className = 'bg-container';

    // 预加载图片
    bgData.forEach(item => {
        const img = new Image();
        img.src = item.img;
    });

    function updateBg(index) {
        const newIndex = (index + bgData.length) % bgData.length;
        const newBg = document.createElement('div');
        newBg.style.background = `url(${bgData[newIndex].img}) center/cover`;
        newBg.style.opacity = 0;

        container.appendChild(newBg);
        setTimeout(() => {
            newBg.style.opacity = 1;
            // 移除旧背景
            if(container.children.length > 1) {
                container.removeChild(container.children[0]);
            }
        }, 50);

        // 更新名言
        const quote = document.querySelector('.quote-overlay');
        quote.style.opacity = 0;
        setTimeout(() => {
            document.querySelector('.quote-text').textContent = bgData[newIndex].quote;
            document.querySelector('.quote-author').textContent = bgData[newIndex].author;
            quote.style.opacity = 1;
        }, 300);

        currentIndex = newIndex;
    }

    return {
        init: (element) => {
            element.prepend(container);
            let isScrolling;
            let deltaY = 0;

            element.addEventListener('wheel', (e) => {
                e.preventDefault();
                deltaY += e.deltaY;
                
                if(Math.abs(deltaY) > 100) {
                    const direction = deltaY > 0 ? 1 : -1;
                    updateBg(currentIndex + direction);
                    deltaY = 0;
                }
            }, { passive: false });

            // 初始化首张背景
            updateBg(0);
        }
    };
})();

// 初始化时调用
document.addEventListener('DOMContentLoaded', () => {
    bgManager.init(document.querySelector('.date-card'));
});







// 移除外层函数包裹，直接暴露逻辑
(function() {
    const poeticWeekdays = ['🌌 星河日', '🌠 月曜日', '🌿 青阳日', '🍃 风吟日', '🌺 花朝日', '🌧  云泽日', '❄  雪霁日'];
    const poeticMonths = ['元月·初阳', '仲月·花信', '桃月·莺时', '槐月·清和', '榴月·鸣蜩', '荷月·溽暑', '兰月·流火', '桂月·未央', '玄月·授衣', '良月·始冰', '葭月·龙潜', '冰月·岁杪'];
    const cnNumbers = ['〇', '一', '二', '三', '四', '五', '六', '七', '八', '九'];

    function poeticDate(day) {
        if(day === 1) return '朔日';
        if(day === 15) return '望日';
        if(day === 30) return '晦日';
        return day < 11 ? `初${cnNumbers[day]}` : 
            `${cnNumbers[Math.floor(day/10)]}${cnNumbers[day%10]}`;
    }

    function updateDate() {
        const now = new Date();
        const targetElement = document.querySelector('.date-day');
        
        // 防止重复嵌套
        if(!targetElement.querySelector('.poetic-day')) {
            targetElement.innerHTML = `
                <span class="poetic-day"></span>
                <sup class="day-suffix"></sup>
            `;
        }

        document.querySelector('.poetic-day').textContent = poeticDate(now.getDate());
        document.querySelector('.date-week').textContent = poeticWeekdays[now.getDay()];
        document.querySelector('.date-year').innerHTML = `
            <span class="poetic-year">${now.getFullYear()}</span>
            <span class="poetic-month">${poeticMonths[now.getMonth()]}</span>
        `;
    }

    // 初始化
    document.addEventListener('DOMContentLoaded', () => {
        console.log('日期模块初始化');
        updateDate();
        setInterval(updateDate, 6000); // 调试时使用1秒间隔
    });
})();