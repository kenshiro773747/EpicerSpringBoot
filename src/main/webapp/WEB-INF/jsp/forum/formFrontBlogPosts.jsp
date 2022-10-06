<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ////// 這是多頁文章的串聯頁面  /////// -->
<style type="text/css">

.multiline-ellipsis { 
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
  overflow: hidden;
}

.post{
/*  border: 2px gray solid; */
/*  border-radius: 30px; */
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
	queryAll()
});



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



function queryAll(){
	document.getElementById("searchTitle").value = ""
		
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
				document.getElementById("mydiv").innerHTML = resultText;
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
				document.getElementById("mydiv").innerHTML = resultText;
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
				document.getElementById("mydiv").innerHTML = resultText;
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








</script>    
<div style="margin-top:22%;">
<div id ="mydiv"></div>
</div>

