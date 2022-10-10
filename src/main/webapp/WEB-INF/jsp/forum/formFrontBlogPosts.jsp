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

button{
margin-left: 1%;
}

.post{
margin-top:10%
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
	queryAll();
	announcementPage()
});



function del(id){
	Swal.fire({
		  title: '刪除文章',
		  text: "確認後無法復原",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '取消',
		  confirmButtonText: '確認!',
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
		 title: '檢舉文章',
		  text: "確認後無法復原",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '取消',
		  confirmButtonText: '確認!',
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
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;

					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px' name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
					
					
					
					
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					
					
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<form action='forumFrontUpdatePage' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
						"</li>"+
						
							
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
							 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</li>"+

						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv").innerHTML = resultText;
				document.getElementById("searchTitle").value = "";
				var report=1;
				for(let i=0;i<data.length;i++){
									judgeIndexPage(data[i].user.userId,i,report);
									report++;
								}

			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("get","frontQueryAllAjax",true)
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
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<form action='forumFrontUpdatePage' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
						"</li>"+
						
							
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
							 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</li>"+

						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv").innerHTML = resultText;
				document.getElementById("searchTitle").value = "";
				var report=1;
					for(let i=0;i<data.length;i++){
						judgeIndexPage(data[i].user.userId,i,report);
						report++;
					}

			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","frontQueryNameAjax",true)
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
				var reports=0;
				for(var i=0;i<data.length;i++){
					var time = new Date(data[i].date);
					reports++;

					
					resultText +=
					"<div class='post'>"+
					"<h1 class='post-title' style='font-size:30px;margin:0 0 0 8%'>"+data[i].title+
					"<button type='button' class='btn btn-warning btn-xs' style='margin-left:10px'  name='"+data[i].plateformCategoryId+"' onclick='category(this)'>"+
					category[data[i].plateformCategoryId-1]+"</button>"+"</h1>"+
		            "<form action='articleFrontDetail' method='post'>"+
					"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
					"<div class='multiline-ellipsis' onclick='this.parentNode.submit()' style='margin:0 0 0 11%'>"+
					data[i].articleContent+
					"</div>"+
					"</form>"+
					"<div class='post-meta' style='margin-top:3%;padding-left:11%'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>"+data[i].articleViews+
							"</li>"+
							"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<form action='forumFrontUpdatePage' method='post'>"+
							"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
						"</li>"+
						
							
						"<li style='font-size: 18px' class = 'judge"+i+"'>"+
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						"</li>"+
						"<li style='font-size: 18px;'  id = 'reports"+reports+"'>"+
							 "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</li>"+

						"</ul>"+
					"</div>"+
				"</div>"
				  
				}
				document.getElementById("mydiv").innerHTML = resultText;
				document.getElementById("searchTitle").value = "";
				var report=1;
					for(let i=0;i<data.length;i++){
						judgeIndexPage(data[i].user.userId,i,report);
						report++;
					}

			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","frontQueryCategoryAjax",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	var searchCategoryId = category.name;
	xhr.send("categoryId="+searchCategoryId)
	
}




function announcementPage(){
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
				var o = 0;
				for(var i=0;i<data.length;i++){
					o++
					var time = new Date(data[i].date);
					resultText +=
						
						"<div class='media' id ='side' style= 'position:relative'>"+
					"<a class='pull-left' href='#!'>"+
						"<img class='media-object' src='./images/公告.jpg' alt='Image' style='height:180px;width:160%'>"+
					"</a>"+
					"<div class='media-body'  style= 'position:absolute; left:0;top:0;'>"+
					 "<form action='articleFrontDetail' method='post'>"+
						"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
						"<div onclick='this.parentNode.submit()'>"+
						"<h4  style='margin-top:1.5%'>"+data[i].title+"</h4>"+
						"</div>"+
						"</form>"+
					"</div>"+
					"</div>";
					
					
			   }
				document.getElementById("sidebar").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryArticleReport",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	xhr.send("status="+2)
	
}


</script>    


<form action="forumUser" method="get">
		  <input type="submit" value="userPage">
        </form>
        
        
        
        
        
        
        
        
        
        
        
        
        
<div style="margin-top:22%;">
<input type="hidden" name="userId" id ="userId" value="<%=Integer.parseInt(session.getAttribute("userId").toString())%>" readonly>
<div id ="mydiv"></div>
</div>

<script>

function judgeIndexPage(id,i,report){
	var userID = document.getElementById('userId').value;
	var x = document.getElementsByClassName('judge'+i);
	  if (id !=userID) {
		  for (var i = 0; i < x.length; i++) {
			  x[i].style.display="none";
		} 
	
	  }else{
		  console.log('reports'+report)
		  document.getElementById('reports'+report).style.display="none";
	  }
}

</script>

