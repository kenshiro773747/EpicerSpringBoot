<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer會員系統</title>
<script  src='js/sweetalert2.min.js'></script>
<script  src='js/jquery-3.6.0.js'></script>
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
						            "<form action='UserUpdateArticlePage' method='post'>"+
										"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
										"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
									"</form>"+
									 "<form id = 'myform"+i+"' action='UserDeleteArticle' method='post'>"+
										"<input type='hidden' name='number' value="+data[i].articleId+">"+
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
		xhr.open("get","QueryAllAjax",true)
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
						            "<form action='UserUpdateReplyPage' method='post'>"+
										"<input type='hidden' name='replyId' value='"+data[i].articleReplyId+"'>"+
										"<button type='submit' class='btn btn-outline-warning'>更新</button>"+
									"</form>"+
									 "<form id = 'myform"+i+"' action='UserDeleteReply' method='post'>"+
										"<input type='hidden' name='replyId' value="+data[i].articleReplyId+">"+
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
		xhr.open("get","QueryUserReply",true)
		//4.發送請求
		xhr.send()
		
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






<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavUser.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->

<form action="QueryAllPage" method="Get">
	<input type="submit" value="回首頁">
</form>
<h1>${userId}號會員歡迎登入</h1>
<div style="text-align: center;">
<button id = "btnArticle" class="btn btn-secondary">搜文章記錄</button>
<button id = "btnReply" class="btn btn-secondary">搜留言紀錄</button>
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