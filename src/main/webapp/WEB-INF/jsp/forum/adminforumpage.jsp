<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>
<script  src='js/sweetalert2.min.js'></script>
<script  src='js/jquery-3.6.0.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">

<style type="text/css">
span{
position: relative;
 overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  max-width: 140px;
  display: inline-block;
  height:20px;
}
</style>

<script>
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
						        "<tr>"+
						          "<td>"+
						          
						            "<div class='d-flex px-2 py-1'>"+
						            "<form action='articleDetail' method='post'>"+
									"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
									"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
									"</form>"+
						               
						            "</div>"+
						          "</td>"+
						          "<td>"+
						            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
						          "</td>"+
						          "<td class='align-middle text-center'>"+
						            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
						         "</td>"+
						          "<td class='align-middle text-center'>"+
						            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
						          "</td>"+
						          "<td class='align-middle text-center'>"+
						            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
						          "</td>"+
						          "<td class='align-middl'>"+
						            "<form action='forumUpdatePage' method='post'>"+
										"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
										"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
									"</form>"+
									 "<form id = 'myform"+i+"' action='articleDelete' method='post'>"+
										"<input type='hidden' name='number' value="+data[i].articleId+">"+
										"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
										"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
									"</form>"+
									"<form id = 'report"+i+"' action='forumReport' method='post'>"+
									"<input type='hidden' name='number' value="+data[i].articleId+">"+
									"<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
								"</form>"+
									
						          "</td>"+
						        "</tr>"
						   
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
					        "<tr>"+
					          "<td>"+
					          "<div class='d-flex px-2 py-1'>"+
					            "<form action='articleDetail' method='post'>"+
					        	"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
								"</form>"+
					            "</div>"+
					          "</td>"+
					          "<td>"+
					            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
					          "</td>"+
					          "<td class='align-middle text-center'>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
					         "</td>"+
					          "<td class='align-middle text-center'>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
					          "</td>"+
					          "<td class='align-middle text-center'>"+
					            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
					          "</td>"+
					          "<td class='align-middl'>"+
					            "<form action='forumUpdatePage' method='post'>"+
									"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
									"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
								"</form>"+
								 "<form id = 'myform"+i+"' action='articleDelete' method='post'>"+
									"<input type='hidden' name='number' value="+data[i].articleId+">"+
									"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
									"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
								"</form>"+
								"<form id = 'report"+i+"' action='forumReport' method='post'>"+
								"<input type='hidden' name='number' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
							"</form>"+
					          "</td>"+
					        "</tr>"
					   
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
				        "<tr>"+
				          "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleDetail' method='post'>"+
				        	"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
				         "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
				          "</td>"+
				          "<td class='align-middl'>"+
				            "<form action='forumUpdatePage' method='post'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
							 "<form id = 'myform"+i+"' action='articleDelete' method='post'>"+
								"<input type='hidden' name='number' value="+data[i].articleId+">"+
								"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							"</form>"+
							"<form id = 'report"+i+"' action='forumReport' method='post'>"+
							"<input type='hidden' name='number' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						"</form>"+
				          "</td>"+
				        "</tr>"
				   
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

function reportPage(){
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
				        "<tr>"+
				          "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleDetail' method='post'>"+
				        	"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].title+"</span>"+
				         "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleContent+"</span>"+
				          "</td>"+
				          "<td class='align-middl'>"+
				            "<form action='forumAdminUpdatePage' method='post'>"+
								"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
							 "<form id = 'myform"+i+"' action='articleDelete' method='post'>"+
								"<input type='hidden' name='number' value="+data[i].articleId+">"+
								"<input type='hidden' name='articleId' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							"</form>"+
				          "</td>"+
				        "</tr>"
				   
			   }
				document.getElementById("mydiv").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryArticleReport",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	xhr.send("status="+1)
	
}


function replyReportPage(){
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
					var time = new Date(data[i].articleReplyDate);
					resultText +=
				        "<tr>"+
				          "<td>"+
				            "<div class='d-flex px-2 py-1'>"+
				            "<form action='articleDetail' method='post'>"+
				        	"<input type='hidden' name='articleId' value='"+data[i].articleId.articleId+"'>"+
							"<button type='submit' class='btn bg-gradient-primary'>"+(i+1)+"</button>"+
							"</form>"+
				            "</div>"+
				          "</td>"+
				          "<td>"+
				            "<p class='text-xs font-weight-bold mb-0'>"+category[data[i].articleId.plateformCategoryId-1]+"</p>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleId.title+"</span>"+
				         "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+time.toLocaleString()+"</span>"+
				          "</td>"+
				          "<td class='align-middle text-center'>"+
				            "<span class='text-secondary text-xs font-weight-bold'>"+data[i].articleReplyContent+"</span>"+
				          "</td>"+
				          "<td class='align-middl'>"+
				            "<form action='replyAdminUpdatePage' method='post'>"+
								"<input type='hidden' name='articleReplyId' value='"+data[i].articleReplyId+"'>"+
								"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
							"</form>"+
							 "<form id = 'myform"+i+"' action='articleDelete' method='post'>"+
								"<input type='hidden' name='replyId' value="+data[i].articleReplyId+">"+
								"<input type='hidden' name='articleId' value="+data[i].articleId.articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							"</form>"+
				          "</td>"+
				        "</tr>"
				   
			   }
				document.getElementById("mydiv").innerHTML = resultText;
			}else{
				alert(this.status);
			}
		}
	}
	//3.開啟通道
	xhr.open("post","QueryReplyReport",true)
	//4.發送請求
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") 
	xhr.send("status="+1)
	
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
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
		    $("#report"+id).submit();
		  }
		})
	
}

</script>
<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->


<% session.setAttribute("userId", 1002); %>

 		<form action="forumUser" method="get">
		  <input type="submit" value="userPage">
        </form>
	        


<div class="input-group mb-3" style="padding:0 5%">
  <input type="text"  name="searchTitle" id ="searchTitle" class="form-control" placeholder="Article title" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-primary mb-0" style="background-color: #f4f5f7" type="button" id="button-addon2" onclick="querytitle()">查詢文章</button>
</div>




<div style="text-align: center;margin:0 0 10px 0"   >
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" onclick="queryAll()">查詢全部</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="1" onclick="category(this)">全榖雜糧</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="2" onclick="category(this)">豆魚蛋肉</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="3" onclick="category(this)">蔬菜</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="4" onclick="category(this)">水果</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="5" onclick="category(this)">乳品</button>
<button type="button" class="btn btn-secondary" style="width:140px; margin:0 1%;" name="6" onclick="category(this)">油脂與堅果種子</button>
<button type="button" class="btn btn-secondary" style="width:140px; margin:0 1%;" name="7" onclick="reportPage()">檢舉文章</button>
<button type="button" class="btn btn-secondary" style="width:95px; margin:0 1%;" name="8" onclick="replyReportPage()">檢舉留言</button>
</div>
<div style="padding:0 5%">
<div class="card" >
  <div class="table-responsive">
    <table class="table align-items-center mb-0">
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">id</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">類型</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">標題</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">時間</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">內文</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">操作</th>
          <th class="text-secondary opacity-7"></th>
        </tr>
      </thead>
    <tbody id ="mydiv"/>
    </table>
  </div>
</div>

</div>










<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		</div>
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->

</body>

</html>