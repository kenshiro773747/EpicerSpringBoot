<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <style>
 
 .sidebarFixed{
  z-index: 10;     
  position: fixed;      
  top:16%;
  left: 65%;
  right:10%;
  opacity: 0.94;
  transition: opacity .5s ease-out;  

}
 
 </style>
 
    
 <!-- ///////////  文章頁的側邊 ///////////// -->
 <!-- ///////////  推播專區 ///////////// -->
 
 
 <!-- /////////// 申請寄發新文章通知信(輸入頁面) ///////////// -->
<aside class="sidebar sidebarFixed">
	<!-- Widget Latest Posts -->
	<div class="widget widget-latest-post">
		<h4 class="widget-title">Latest Posts</h4>
		<div class="media">
			<a class="pull-left" href="#!">
				<img class="media-object" src="./source/images/blog/post-thumb.jpg" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="#!">Introducing Swift for Mac</a></h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, officia.</p>
			</div>
		</div>
		<div class="media">
			<a class="pull-left" href="#!">
				<img class="media-object" src="./source/images/blog/post-thumb-3.jpg" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="#!">Warm welcome from swift</a></h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, officia.</p>
			</div>
		</div>
		<div class="media">
			<a class="pull-left" href="#!">
				<img class="media-object" src="./source/images/blog/post-thumb.jpg" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="#!">Introducing Swift for Mac</a></h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, officia.</p>
			</div>
		</div>
	</div>
	<!-- End Latest Posts -->


 <!-- /////////// 文章分類-風格2 (關鍵字方式/可用於食譜) ///////////// -->
	<!-- Widget tag -->
	<div class="widget widget-tag">
		<h4 class="widget-title">Tag Cloud</h4>
		<ul class="widget-tag-list">
	         <li>
	        <a href="javascript: void(0)" onclick="queryAll()" >全部</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="1" onclick="category(this)">全榖雜糧</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="2" onclick="category(this)">豆魚蛋肉</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="3" onclick="category(this)">蔬菜</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="4" onclick="category(this)">水果</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="5" onclick="category(this)">乳品</a>
	        </li>
	        <li>
	        <a href="javascript: void(0)" name="6" onclick="category(this)">油脂與堅果種子</a>
	        </li>
	    </ul>
	</div> <!-- End tag  -->

</aside>