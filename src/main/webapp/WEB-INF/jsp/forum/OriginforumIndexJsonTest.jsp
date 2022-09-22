<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<script  src='js/sweetalert2.min.js'></script>
<script  src='js/jquery-3.6.0.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
<script>
	function queryAll(){
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
						resultText +="<td><form action='forumUpdatePage' method='post'>"+
						"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
						"<input type='submit' value='Update'></form>"+
						
						//刪除
						"<form  id = 'myform"+i+"' action='articleDelete' method='post'>"+
						"<input type='hidden' name='number' value="+data[i].articleId+">"+
						"<input type='button' value='Delete' onclick='del("+i+")'></form>
						
						//收藏
						"<form  id = 'action='articleDelete' method='post'>"+
						"<input type='hidden' name='number' value="+data[i].articleId+">"+
						"<input type='button' value='Delete' onclick='del("+i+")'></form>
						</td>"
						resultText +="</tr>"
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
						resultText +="<td><form action='forumUpdatePage' method='post'>"+
						"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
						"<input type='submit' value='Update'></form>"+
						
						//刪除
						"<form  id = 'myform"+i+"' action='articleDelete' method='post'>"+
						"<input type='hidden' name='number' value="+data[i].articleId+">"+
						"<input type='button' value='Delete' onclick='del("+i+")'></form></td>"
						resultText +="</tr>"
					   }
					document.getElementById("mydiv").innerHTML = resultText;
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
					resultText +="<td><form action='forumUpdatePage' method='post'>"+
					"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
					"<input type='submit' value='Update'></form>"+
					
					//刪除
					"<form  id = 'myform"+i+"' action='articleDelete' method='post'>"+
						"<input type='hidden' name='number' value="+data[i].articleId+">"+
						"<input type='button' value='Delete' onclick='del("+i+")'></form></td>"
					resultText +="</tr>"
				   }
				document.getElementById("mydiv").innerHTML = resultText;
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
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
		    $("#myform"+id).submit();
		  }
		})
	
}


</script>

</head>
<body>
<%@include file="epicerNavbar.jsp"%>
<% session.setAttribute("userId", 10); %>

 		<form action="forumUser" method="get">
		  <input type="submit" value="userPage">
        </form>
<form action="forumAdd" method="post">
		  <input type="submit" value="新增文章">
        </form>
<input type="button" value="查詢全部" onclick="queryAll()"><br/>
<input type="text" name="searchTitle" id ="searchTitle" > <input type="button" value="查詢文章" onclick="querytitle()"><br/>
<input type="button" value="全榖雜糧" name="1" onclick="category(this)">
<input type="button" value="豆魚蛋肉" name="2" onclick="category(this)">
<input type="button" value="蔬菜" name="3" onclick="category(this)">
<input type="button" value="水果" name="4" onclick="category(this)">
<input type="button" value="乳品" name="5" onclick="category(this)">
<input type="button" value="油脂與堅果種子" name="6" onclick="category(this)">
<table width="500px" border="1px">
      <thead>
      <tr>
          <th>id</th>
          <th>類型</th>
          <th>標題</th>
          <th>時間</th>
          <th>內文</th>
          <th>操作</th>
      </tr>
      </thead>
<tbody id ="mydiv"/>

  </table>



</body>
</html>