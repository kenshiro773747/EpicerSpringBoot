<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////   文章(食譜/論壇) 右側有分類    ////////// -->    
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">


<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<div style="position: fixed; z-index: 20;width:100%; background-color: white;">
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<div class="input-group mb-3 searchTitle">
<table>
<tr>
<td style="width:100%"><input type="text"  name="searchTitle" id ="searchTitle" class="form-control searchInput" style="margin-bottom:20px" placeholder="Article title" aria-label="Recipient's username" aria-describedby="button-addon2"></td>
<td style="margin: auto"><button class="btn btn-outline-primary mb-0 searchButton"  type="button" id="button-addon2" onclick="querytitle()">查詢文章</button></td>
</tr>
</table>
</div>
<div style="margin-top:5px">
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>
</div>
</div>
<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->

<div class="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-8" style="padding-right: 10%">
        		<!-- ///////  文章發布 (多篇風格頁面)  ////// -->
			<!-- @@include('blocks/blog-posts.htm') -->
			<%@include file="formFrontBlogPosts.jsp" %>
      		</div>
      		<div class="col-md-4">
					<!-- ///////////  文章頁的側邊 -推播專區 ///////////// -->
				<!-- @@include('blocks/post-sidebar.htm') -->
				<%@include file="formFrontBlogSidebar.jsp" %>
      		</div>
		</div>
	</div>
</div>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>