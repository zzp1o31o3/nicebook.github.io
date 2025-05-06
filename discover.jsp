<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>发现 | 每日好句</title>
    <link rel="stylesheet" href="css/discovery.css?v=12">
    <style>
        body {
            background: url('../images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            font-family: "Microsoft YaHei", "PingFang SC", sans-serif;
            color: #333;
            padding-bottom: 60px;
        }
    </style>
</head>
<body>
    <%@ include file="top-nav.jsp" %>
    
    <main class="content-container">
        <% 
        // 精选语录数据
        List<String> quotes = Arrays.asList(
            "我荒废的今日，正是昨日殒身之人祈求的明白。——《哈佛大学图书馆管训》",
            "不如意事常八九，可与人言无二三。——高文秀《谇范叔》",
            "乞丐不会妒忌百万富翁，但是他肯定会妒忌收入更高的乞丐。——罗素",
            "人并不因为美丽才可爱，而是因为可爱才美丽。——托尔斯泰《安娜·卡列尼娜》",
            "友谊是两颗心的真诚相待，而不是一颗心对另一颗心的敲打。——鲁迅《鲁迅杂文选》",
            "孤独是一个人的狂欢，狂欢是一群人的孤独。——泰戈尔",
            "傲慢让别人无法来爱我，偏见让我无法去爱别人。——简·奥斯汀",
            "追逐影子的人，自己就是影子。——荷马",
            "世间最好的默契，并非有人懂你的言外之意，而是有人懂你的欲言又止。——瑞卡斯",
            "浅水是喧哗的，深水是沉默的。——雪莱",
            "命定的局限尽可存在，不屈的挑战却不可须臾或缺。——史铁生《我与地坛》",
            "信阳是心中的绿洲，思想的骆驼队是永远走不到的。——纪伯伦《沙与沫》",
            "亿万个辉煌的太阳，呈现在打碎的镜子上。——海子",
            "你能找一个理由让自己伤心，也能找一个理由让自己快乐。——马克·吐温",
            "所谓自信，是原本做不好的事一点点取得进步。——中村恒子《人间值得》",
            "自由不是让你想做什么就做什么，自由是教你不想做什么，就可以不做什么。——康德",
            "不愿随波逐流，但是一味的逆流而上也许只是徒劳的让自己疲惫。——村上春树《1Q84》",
            "不同的日子看不见的云，替相同的草花浇不同的水。——简媜《私房书》",
            "当你偶尔发现语言变得无力时，不妨安静下来，让沉默替你发声。——里则林",
            "愿你的生命中有够多的云翳，造成一个美丽的黄昏。——冰心《霞》"
        );
        
        // 生成随机互动数据
        Random random = new Random();
        %>

        <!-- 优化后的轮播区域 -->
        <div class="carousel-container" id="imageCarousel">
            <% for(int i=1; i<=20; i++) { 
                String[] quoteParts = quotes.get(i-1).split("——");
                String quoteText = quoteParts[0];
                String author = quoteParts.length > 1 ? "—— " + quoteParts[1] : "";
                
                // 为每个项目生成不同的互动数据
                int likeCount = 80 + random.nextInt(100);
                int starCount = 30 + random.nextInt(70);
                int commentCount = 10 + random.nextInt(40);
            %>
                <div class="carousel-item <% if(i == 1) { %>active<% } %>" data-index="<%= i %>">
                    <div class="carousel-content">
                        <img src="images/discovery/image<%= i %>.jpg" alt="精选图片<%= i %>" class="carousel-img">
                        <div class="text-box">
                            <h3>好句精选 #<%= i %></h3>
                            <div class="quote-wrapper">
                                <p class="quote-content"><%= quoteText %></p>
                                <p class="quote-author"><%= author %></p>
                            </div>
                        </div>
                        <div class="interaction-buttons">
                            <button class="interaction-btn like-btn" data-type="like" data-initial="<%= likeCount %>">
                                <span class="btn-icon icon-heart">❤️</span>
                                <span class="btn-text">点赞</span>
                                <span class="count"><%= likeCount %></span>
                                <span class="click-effect"></span>
                            </button>
                            <button class="interaction-btn star-btn" data-type="star" data-initial="<%= starCount %>">
                                <span class="btn-icon icon-star">⭐</span>
                                <span class="btn-text">收藏</span>
                                <span class="count"><%= starCount %></span>
                                <span class="click-effect"></span>
                            </button>
                            <button class="interaction-btn comment-btn" data-type="comment" data-initial="<%= commentCount %>">
                                <span class="btn-icon icon-comment">💬</span>
                                <span class="btn-text">评论</span>
                                <span class="count"><%= commentCount %></span>
                                <span class="click-effect"></span>
                            </button>
                        </div>
                    </div>
                </div>
            <% } %>
            <button class="carousel-nav prev-btn">❮</button>
            <button class="carousel-nav next-btn">❯</button>
        </div>

        <!-- 过渡区域 -->
        <div class="section-transition">
            <div class="transition-line"></div>
            <div class="transition-icon">✦ ✦ ✦</div>
        </div>

        <!-- 游戏板块（保持不变） -->
        <section class="random-quote" id="quoteSection">
            <div class="quote-card">
                <button id="randomQuoteBtn" class="quote-btn pulse">
                    <span class="btn-icon">🌠</span>
                    <span class="btn-text">点击得到答案</span>
                </button>
                <div class="quote-display">
                    <div class="quote-decoration">
                        <div class="quote-mark-left">"</div>
                        <div class="quote-mark-right">"</div>
                    </div>
                    <p class="quote-text">心中想一个问题，然后等待三秒按下</p>
                    <p class="quote-author"></p>
                    <div class="quote-footer">
                        <span class="quote-tag">答案之书</span>
                        <span class="quote-date"><%= new java.text.SimpleDateFormat("yyyy年MM月dd日").format(new java.util.Date()) %></span>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="bottom-nav.jsp" %>
    <script src="js/discovery.js?v=12"></script>
</body>
</html>