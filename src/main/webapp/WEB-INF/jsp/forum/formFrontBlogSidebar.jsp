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
				<img class="media-object" src="./source/images/blog/post-thumb-2.jpg" alt="Image">
			</a>
			<div class="media-body">
				<h4 class="media-heading"><a href="#!">Welcome to Themefisher Family</a></h4>
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


 <!-- /////////// 文章分類-風格1 ///////////// -->
	<!-- Widget Category -->
	<div class="widget widget-category">
		<h4 class="widget-title">Categories</h4>
		<ul class="widget-category-list">
	        <li><a href="#!">Animals</a>
	        </li>
	        <li><a href="#!">Landscape</a>
	        </li>
	        <li><a href="#!">Portrait</a>
	        </li>
	        <li><a href="#!">Wild Life</a>
	        </li>
	        <li><a href="#!">Video</a>
	        </li>
	    </ul>
	</div> <!-- End category  -->

 <!-- /////////// 文章分類-風格2 (關鍵字方式/可用於食譜) ///////////// -->
	<!-- Widget tag -->
	<div class="widget widget-tag">
		<h4 class="widget-title">Tag Cloud</h4>
		<ul class="widget-tag-list">
	        <li><a href="#!">Animals</a>
	        </li>
	        <li><a href="#!">Landscape</a>
	        </li>
	        <li><a href="#!">Portrait</a>
	        </li>
	        <li><a href="#!">Wild Life</a>
	        </li>
	        <li><a href="#!">Video</a>
	        </li>
	    </ul>
	</div> <!-- End tag  -->

</aside>