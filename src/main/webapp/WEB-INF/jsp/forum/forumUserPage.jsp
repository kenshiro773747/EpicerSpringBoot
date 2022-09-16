<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員畫面</title>
<script  src='js/sweetalert2.min.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
<script>

window.onload=function(){
	
	document.getElementById("btnArticle").onclick=function(){
		//1.創建ajax對象
		var xhr = new XMLHttpRequest();
		//2.註冊回調函數
		xhr.onreadystatechange = function(){
			if(this.readyState ==4 ){
				if(this.status==200){
					var data = JSON.parse(this.responseText);
					var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
					var resultText = '';
					resultText +="<thead><tr><th>id</th><th>類型</th><th>標題</th><th>時間</th><th>內文</th><th>操作</th></tr></thead>"
					for(var i=0;i<data.length;i++){
						var time = new Date(data[i].date);
						resultText +="<tr>"
						//Detail
						resultText +="<td>"+"<form action='articleDetail' method='post'>"+
						"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
						"<input type='submit' value="+(i+1)+">"+"</form>"+"</td>"
						
						
						//類型
						resultText +="<td>"+category[data[i].plateformCategoryId-1]+"</td>"
						
						
						resultText +="<td>"+data[i].title +"</td>"
						resultText +="<td>"+time.toLocaleString()+"</td>"
						resultText +="<td>"+data[i].articleContent+"</td>"
						
						//更新
						resultText +="<td><form action='UserUpdateArticlePage' method='post'>"+
						"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
						"<input type='submit' value='Update'></form>"+
						
						//刪除
						"<form id=myForm action='UserDeleteArticle' method='post'>"+
						"<input type='hidden' name='number' value="+data[i].articleId+">"+
						"<input type='button' value='Delete' onclick='del("+this.form+")'></form></td>"
						resultText +="</tr>"
					   }
					document.getElementById("mydiv").innerHTML = resultText;
				}else{
					alert(this.status);
				}
			}
		}
		//3.開啟通道
		xhr.open("Get","QueryUserArticle",true)
		//4.發送請求
		xhr.send()
		
	}
	
	document.getElementById("btnReply").onclick=function(){
		//1.創建ajax對象
		var xhr = new XMLHttpRequest();
		//2.註冊回調函數
		xhr.onreadystatechange = function(){
			if(this.readyState ==4 ){
				if(this.status==200){
					var data = JSON.parse(this.responseText);
					var category = ['全榖雜糧', '豆魚蛋肉', '蔬菜', '水果', '乳品', '油脂與堅果種子'];
					var resultText = '';
					resultText +="<thead><tr><th>id</th><th>類型</th><th>標題</th><th>時間</th><th>回覆內容</th><th>操作</th></tr></thead>"

					for(var i=0;i<data.length;i++){
						var time = new Date(data[i].articleReplyDate);
						resultText +="<tr>"
						//Detail
						resultText +="<td>"+"<form action='articleDetail' method='post'>"+
						"<input type='hidden' name='articleId' value="+data[i].articleId.articleId+">"+
						"<input type='submit' value="+(i+1)+">"+"</form>"+"</td>"
						
						
						//類型
						resultText +="<td>"+category[data[i].articleId.plateformCategoryId-1]+"</td>"
						resultText +="<td>"+data[i].articleId.title +"</td>"
						resultText +="<td>"+time.toLocaleString()+"</td>"
						resultText +="<td>"+data[i].articleReplyContent+"</td>"
						
						//更新
						resultText +="<td><form action='UserUpdateReplyPage' method='post'>"+
						"<input type='hidden' name='replyId' value="+data[i].articleReplyId+">"+
						"<button type='submit'>Update</button></form>"+
						
						//刪除
						"<form id=myForm action='UserDeleteReply' method='post'>"+
						"<input type='hidden' name='replyId' value="+data[i].articleReplyId+">"+
						"<input type='button' value='Delete' onclick='del("+this.form+")'></form></td>"
						resultText +="</tr>"
					   }
					document.getElementById("mydiv").innerHTML = resultText;
				}else{
					alert(this.status);
				}
			}
		}
		//3.開啟通道
		xhr.open("Get","QueryUserReply",true)
		//4.發送請求
		xhr.send()
	}
	
	
}

function del(form){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!',
		  
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
		    document.getElementById("myForm").submit();
		  }
		})

	
}	


</script>
</head>
<body>
<%@include file="epicerNavbar.jsp"%>
<form action="QueryAllPage" method="Get">
	<input type="submit" value="回首頁">
</form>
<h1>會員畫面</h1>
${userId}歡迎登入
<button id = "btnArticle">搜文章記錄</button>
<button id = "btnReply">搜留言紀錄</button>
<table width="500px" border="1px">
<tbody id ="mydiv"/>
</table>
</body>
</html>