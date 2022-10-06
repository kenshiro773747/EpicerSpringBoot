	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
    
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=63296382a700c90019f6dc52&product=image-share-buttons" async="async"></script>
<script language='javascript' src='js/wangEditor.min.js'></script>
<script  src='js/sweetalert2.min.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
    <!-- ////// 這是多頁文章的串聯頁面  /////// -->
    
<style type="text/css">

.w-e-text-container{
    height: 200px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
}

.multiline-ellipsis { 
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
  overflow: hidden;
}

.post{
margin-top: 20%
}

.pic {
  width: 500px;
  height: 350px;
  margin: 50px;
  border: 2px solid;
}
.pic img {
  object-fit: contain;
  width: 500px;
  height: 350px;
}

.searchTitle{
  z-index: 10;     
  position: fixed;      
  top:10%;
  width:65%;
  left: 13%;
  opacity: 0.94;
  transition: opacity .5s ease-out;  

}

.searchInput{
width:280px;
height:28px;
border:2px solid;
float:left;
margin-top:20px;
border-bottom-left-radius:15px;
border-top-left-radius:15px;
outline:none;

}

.searchButton{
margin-left:20%;
border:2px solid;
background-color: #f4f5f7;
height:46px
}



</style>

<script>
$(document).ready(function(){
	queryReply();
	queryCollect();
});


function queryAll(){
	
	
		if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px' name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
					
					
					
					
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div onclick='this.parentNode.submit()'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					
					
					"<div class='post-meta' style='margin-top:50px;text-align:center'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>收藏數"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>留言數"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>觀看數"+data[i].articleViews+
							"</li>"+
						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("searchTitle").value = ""
				document.getElementById("mydiv2").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","QueryAllAjax",true)
	//4.發送請求
	xhr.send()
	
}


function querytitle(){
	
	if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div onclick='this.parentNode.submit()'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:50px;text-align:center'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>收藏數"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>留言數"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>觀看數"+data[i].articleViews+
							"</li>"+
						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv2").innerHTML = resultText;
				document.getElementById("searchTitle").value = ""
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryNameAjax",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var searchTitle = document.getElementById("searchTitle").value;
	console.log(searchTitle);
	xhr.send("title="+searchTitle)
	
}



function category(category){
	
	if(document.getElementById("div1")!==null){
		document.getElementById("detail").remove();
	}
		
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				
				var data = JSON.parse(this.responseText);
				var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
				var resultText = '';
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div onclick='this.parentNode.submit()'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:50px;text-align:center'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>收藏數"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>留言數"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>觀看數"+data[i].articleViews+
							"</li>"+
						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv2").innerHTML = resultText;
				document.getElementById("searchTitle").value = ""
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryCategoryAjax",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var searchCategoryId = category.name;
	xhr.send("categoryId="+searchCategoryId)
	
}









function queryCollect(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var resultText = '';
					if(data==true){
					resultText +=
						"<tr>"+
						"<td id='favorite'>"+
					"<button type='button' class='btn btn-danger' onclick ='deleteCollect()'>取消收藏</button>"+
					"</td>"+
					"</tr>"
				   }else if(data==false){
					   resultText +=
						   "<tr>"+
						   "<td id='favorite'>"+
							"<button type='button' class='btn bg-gradient-primary' onclick ='addCollect()' >收藏</button>"+
							"<td>"+
							"</tr>"
				}
				document.getElementById("collect").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","CollectStatus",true)
	//4.
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId)
	
}


function detailAjax(){
	
	//1.創建ajax對象
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var time = new Date(data.date);
				var resultText = '';
					
					resultText +=
						"<ul>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
					"</li>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-ios-heart'></i>收藏數"+data.articleLike+
					"</li>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-ios-calendar'></i>留言數"+data.articleReplys+
					"</li>"+
					"<li style='font-size: 18px'>"+
					"<i class='tf-ion-android-person'></i>觀看數"+data.articleViews+
					"</li>"+
					"</ul>"
				 
				document.getElementById("detailAjax").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","articleAjaxtDetail",true)
	//4.
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId)
	
}





function queryReply(){
	
	if($('textarea').val()!=""){
	var xhr = new XMLHttpRequest();
	//2.註冊回調函數
	xhr.onreadystatechange = function(){
		if(this.readyState ==4 ){
			if(this.status==200){
				var data = JSON.parse(this.responseText);
				var o = 0;
				var resultText = '';
				for(var i=0;i<data.length;i++){
					
					var time = new Date(data[i].articleReplyDate);
					console.log(data);
				o++
					resultText +=
						"<div class='post-comments'>"+
						"<ul class='media-list comments-list m-bot-50 clearlist'>"+
						"<li class='media'>"+
						"<a class='pull-left' href='#!'>"+
						" <img class='media-object comment-avatar' src='./source/images/blog/avater-1.jpg' alt='' width='50' height='50'>"+
						"</a>"+
						"<div class='media-body'>"+
						"<div class='comment-info'>"+
						" <div class='comment-author'>"+
						"<a href='#!'>"+data[i].user.userId+"</a>"+
						"</div>"+
						"<time>"+time.toLocaleString()+"</time>"+
						"</div>"+
						"<p>"+data[i].articleReplyContent+" </p>"+
						" </div>"+
						" </li>"+
						"</ul>"+
						"</div>"+

						
						"<tr style='background-color:#FFD494'>"+
					            "<div class='d-flex px-2 py-1'>"+
					            
					            "<div id ='judge'>"+
					            "<form action='replyUpdatePage' method='post'>"+
								"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
								"</form>"+
								"<input type='hidden' name='replyId' id ='replyId"+i+"' value="+data[i].articleReplyId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='delReply("+i+")'>刪除</button>"+
								"</div>"+
									
									
									"<button type='button' class='btn btn-outline-warning' onclick='replyReport("+i+")'>檢舉</button>"+
								
					          "</td>"+
					          "</div>"+
					        "</tr>";
				judgeMember(data[i].user.userId);
				}
				document.getElementById("comments").innerHTML ="<h3 class='post-sub-heading'>"+o+" Comments</h3>";
				document.getElementById("mydiv").innerHTML = resultText;
				detailAjax();
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","replyDetail",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var articleId = document.getElementById('ArticleId').value;
	var replyContent = $('textarea').val();
	xhr.send("articleId="+articleId+"&"+"replyContent="+replyContent)
	}
	else{
		var xhr = new XMLHttpRequest();
		//2.註冊回調函數
		xhr.onreadystatechange = function(){
			if(this.readyState ==4 ){
				if(this.status==200){
					var data = JSON.parse(this.responseText);
					var o = 0;
					var resultText = '';
					for(var i=0;i<data.length;i++){
						
						var time = new Date(data[i].articleReplyDate);
						o++
							resultText +=
									"<div class='post-comments'>"+
									"<ul class='media-list comments-list m-bot-50 clearlist'>"+
									"<li class='media'>"+
									"<a class='pull-left' href='#!'>"+
									" <img class='media-object comment-avatar' src='./source/images/blog/avater-1.jpg' alt='' width='50' height='50'>"+
									"</a>"+
									"<div class='media-body'>"+
									"<div class='comment-info'>"+
									" <div class='comment-author'>"+
									"<a href='#!'>"+data[i].user.userId+"</a>"+
									"</div>"+
									"<time>"+time.toLocaleString()+"</time>"+
									"</div>"+
									"<p>"+data[i].articleReplyContent+" </p>"+
									" </div>"+
									" </li>"+
									"</ul>"+
									"</div>"+
								
							        "<tr  style='background-color:#FFD494'>"+
							          "<td>"+
							            "<div class='d-flex px-2 py-1'>"+
							            "<div id = 'judge'>"+
							            "<form action='replyUpdatePage' method='post'>"+
										"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
										"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
										"</form>"+
										"<input type='hidden' name='replyId' id ='replyId"+i+"' value="+data[i].articleReplyId+">"+
										"<button type='button' class='btn btn-outline-warning' onclick='delReply("+i+")'>刪除</button>"+
										"</div>"+
										
										"<button type='button' class='btn btn-outline-warning' onclick='replyReport("+i+")'>檢舉</button>"+
										
							          "</td>"+
							          "</div>"+
							        "</tr>";
						judgeMember(data[i].user.userId);
						}
					detailAjax();
					document.getElementById("comments").innerHTML ="<h3 class='post-sub-heading'>"+o+" Comments</h3>";
					document.getElementById("mydiv").innerHTML = resultText;
				}else{
					alert(this.status);
				}
			}
		}
		xhr.open("post","replyEmptyDetail",true)
		//4.發送請求
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
		var articleId = document.getElementById('ArticleId').value;
		var replyContent = $('textarea').val();
		xhr.send("articleId="+articleId)
		
	}


}


function del(id){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
			  var xhr = new XMLHttpRequest();
		    	xhr.open("post","articleDelete",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var articleId = document.getElementById("articleID"+id).value;
		    	var number = document.getElementById("number"+id).value;
		    	xhr.send("number="+number);
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    ).then((result) => {
		    	queryAll();
		    })
		  }
		})
	
}


function judgeMember(id){
	var userID = document.getElementById('userId').value;
	  if (id !=userID) {
		  document.getElementById('judge').style.display = 'none';
	  }
}




function report(id){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定檢舉!'
		}).then((result) => {
	    	var xhr = new XMLHttpRequest();
	    	xhr.open("post","forumReport",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var number = document.getElementById("number"+id).value;
	    	xhr.send("number="+number);
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    ).then((result) => {

		    	queryAll();
		    })
		  }
		})
	
}

function delReply(id){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
			var xhr = new XMLHttpRequest();
	    	xhr.open("post","replyDelete",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var articleId = document.getElementById("ArticleId").value;
	    	var replyId = document.getElementById("replyId"+id).value;
	    	xhr.send("articleId="+articleId+"&"+"replyId="+replyId);
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    ).then((result) => {
		    	queryReply();
		    	})
		  }
		})
	
}



function replyReport(id){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '檢舉!'
		}).then((result) => {
			var xhr = new XMLHttpRequest();
	    	xhr.open("post","replyReport",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var articleId = document.getElementById("ArticleId").value;
	    	var replyId = document.getElementById("replyId"+id).value;
	    	xhr.send("articleId="+articleId+"&"+"replyId="+replyId);
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    ).then((result) => {
		    	
		    	queryReply();
		    	})
		  }
		})
	
}
		
$("#testReset").on("click",function(){
	editor.txt.clear();
})

function addCollect(){
	var xhr = new XMLHttpRequest();
	xhr.open("post","insertCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	
	$("#favorite").empty();
	$("#favorite").append("<button type='button' class='btn btn-danger' onclick ='deleteCollect()'>取消收藏</button>");
	detailAjax();
}


function deleteCollect(){
	var xhr = new XMLHttpRequest();
	xhr.open("post","delCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	$("#favorite").empty();
	$("#favorite").append("<button type='button' class='btn bg-gradient-primary' onclick ='addCollect()' >收藏</button>");
	detailAjax();

}
</script>
<div id ="detail">
<table >
               <%
      	   ArticleBean detail = (ArticleBean)request.getSession().getAttribute("selectDetail");  
               %>
               <% String[] category = {"全榖雜糧","豆魚蛋肉","蔬菜","水果","乳品","油脂與堅果種子"};%>
            <div class='post'>
					<h1 class="post-title" style="font-size:30px;margin:0 0 0 8%"><%=detail.getTitle()%>
					<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px' name='"+data[i].plateformCategoryId+"' onclick='category(this)'>
					<%=category[detail.getPlateformCategoryId()-1]%></button></h1>
		           <%=detail.getArticleContent()%>
					<div class='post-meta' style='margin-top:50px;text-align:center'>
					<div id="detailAjax"></div>

					</div>
            </tbody>
</table>     
<div style="padding-left:5%;display:inline">
<table>
 <tbody id ="collect"/>
</table>
</div>

        <table>
       	   <tr>
				<input type="hidden" name="articleId" id ="ArticleId" value="<%=request.getParameter("articleId")%>" readonly>
				<input type="hidden" name="userId" id ="userId" value="<%=Integer.parseInt(session.getAttribute("userId").toString())%>" readonly>
			</tr>
            <tr>
                <div id="div1"></div>
                <textarea id="text1" name="replyContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
            </tr>
            <tr>
                <td><input type = "button"  id="testReset" name="submit" class="btn bg-gradient-primary" onclick="queryReply()" value="發佈"></td>
            </tr>
        </table>

			<div class="post-social-share">
				        <h3 class="post-sub-heading">Share this post</h3>
				        <div class="social-media-icons">
				        	<ul>
								<li><a class="facebook" href="https://themefisher.com/"><i class="tf-ion-social-facebook"></i></a></li>
								<li><a class="twitter" href="https://themefisher.com/"><i class="tf-ion-social-twitter"></i></a></li>
								<li><a class="dribbble" href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
								<li><a class="instagram" href="https://themefisher.com/"><i class="tf-ion-social-instagram"></i></a></li>
								<li><a class="googleplus" href="https://themefisher.com/"><i class="tf-ion-social-googleplus"></i></a></li>
							</ul>
				        </div>
			</div>
<div id = "comments"></div>
<div id ="mydiv"></div>
</div>

<div id ="mydiv2"></div>		    

<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/WangReply.js'></script>

<script>
function addCollect(){
	
	var xhr = new XMLHttpRequest();
	xhr.open("post","insertCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	
	$("#favorite").empty();
	detailAjax();
	$("#favorite").append("<button type='button' class='btn btn-danger' onclick ='deleteCollect()'>取消收藏</button>");
	
}


function deleteCollect(){
	
	var xhr = new XMLHttpRequest();
	xhr.open("post","delCollect",true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	var articleId = document.getElementById("ArticleId").value;
	xhr.send("articleId="+articleId);
	$("#favorite").empty();
	detailAjax();
	$("#favorite").append("<button type='button' class='btn bg-gradient-primary' onclick ='addCollect()' >收藏</button>");
	

}
</script>
