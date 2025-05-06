<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>每日好句 </title>
<link rel="stylesheet" href="css/main-style.css">
<script src="js/readingTime.js"></script>
<script src="js/dateUpdater.js"></script>
</head>
<body>
	<%@ include file="top-nav.jsp"%>
	
	<!-- 原内容容器保持竹林背景风格 -->
	<main class="content-container">
	
		<!-- 日期卡片模块 -->
		<section class="date-card">
    <div class="bg-container"></div>
    <div class="date-content" >
        <div class="date-backdrop"> <!-- 添加日期背景 -->
        <div class="date-display">
            <!-- 修改日期显示结构 -->
<div class="date-day poetic-container">
    <span class="poetic-day poetic-prefix">二〇</span>
 
</div>
            <div class="date-info">
                <span class="date-week poetic-week">星河日</span>
                <span class="date-year poetic-year-group">2025 槐月</span>
                </div>
            </div>
        </div>
        <div class="quote-overlay">
            <p class="quote-text">"山林不向四季起誓，荣枯随缘"</p>
            <p class="quote-author">—— 简媜《海誓》</p>
        </div>
    </div>
</section>
		<!-- 互动区域（保持原时间+按钮布局） -->
		<!-- 修改interaction-panel部分 -->
<div class="interaction-panel">
    <div class="reading-time">
        <span class="icon-clock">⏰</span> 
        <span>阅读时长 556分21秒</span>
    </div>
    <div class="bamboo-progress">
        <div class="bamboo-stem"></div>
        <div class="ink-flow" style="width: 75%">
            <div class="floating-leaves"></div>
        </div>
        <div class="poetic-indicator">华自气书诗有腹 📖 涯生裹布大缯粗</div>
    </div>
</div>

		<!-- 扩展阅读（保持书单样式） -->
		<section class="extension-reading">
			<h2 class="section-title">📚 今日推荐阅读</h2>
			<ul class="reading-list">
				<li><span class="icon-book">📖</span> 《海誓》简媜·散文集 <a href="https://www.rain8.com/wenzhang/8645.html"
					class="read-link">在线阅读 →</a></li>
				<li><span class="icon-book">📖</span> 《人间词话》王国维·诗词评论 <a
					href="https://www.gushiwen.cn/guwen/book.aspx?id=b7e8afddae7d" class="read-link">在线阅读 →</a></li>
				<li><span class="icon-book">📖</span> 《百年孤独》加西亚·马尔克斯·小说 <a
					href="http://www.mouxiao.com/book/100niangudu/neirong/index.html" class="read-link">在线阅读 →</a></li>
				<li><span class="icon-book">📖</span> 《活着》余华·长篇虚构类 <a href="https://www.kepub.net/book/10001"
					class="read-link">在线阅读 →</a></li>
				<li><span class="icon-book">📖</span> 《月亮与六便士》毛姆·长篇小说 <a
					href="https://www.kunnu.com/liubianshi/" class="read-link">在线阅读 →</a></li>
				<li><span class="icon-book">📖</span> 《瓦尔登湖》亨利·戴维·梭罗·散文 <a
					href="https://luoxiadushu.com/walden/" class="read-link">在线阅读 →</a></li>
			</ul>
		</section>
	</main>

	<%@ include file="/bottom-nav.jsp"%>
</body>
</html>