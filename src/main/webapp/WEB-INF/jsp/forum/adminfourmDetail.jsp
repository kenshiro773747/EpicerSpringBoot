<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.epicer.controller.forum.*,com.epicer.model.forum.*,com.epicer.service.forum.*,com.epicer.util.*,java.util.*"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=63296382a700c90019f6dc52&product=image-share-buttons" async="async"></script>
<script language='javascript' src='js/wangEditor.min.js'></script>
<script  src='js/sweetalert2.min.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">
<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->

<style type="text/css">
.w-e-text-container{
   height: 250px !important; 
}

td{
width: 200px
}

</style>


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
<img src="images/photo.png" with="100%" heigh="50px" alt="一張圖片">
<table >
               <%
      	   ArticleBean detail = (ArticleBean)request.getSession().getAttribute("selectDetail");  
 		%>
            <tbody >
            <tr><h1 style="text-align: center;"><%=detail.getTitle()%></h1></tr>
            <tr><p style="text-align: center;"><%=TimeTest.transToDate(detail.getDate())%></p></tr>
            <tr><div style="text-align: center;"><%=detail.getArticleContent()%></div></tr>
            
            
            </tbody>
      </table>     
		<br>	
		<br>
		
<div style="padding-left:5%">



<form action="insertCollect" method="post"  style="width:800px">
	<input type="hidden" name="articleId" value="<%=request.getParameter("articleId")%>">
    <input type = "submit" name="submit" class="btn bg-gradient-primary" value="收藏">
    
</form>

<form action="delCollect" method="post"  style="width:800px">
	<input type="hidden" name="articleId" value="<%=request.getParameter("articleId")%>">
    <input type = "submit" name="submit" class="btn bg-gradient-primary" value="del收藏">
    
</form>

<h1>留言版</h1>
<form action="replyAdd" method="post"  style="width:800px">
        <table>
       	   <tr>
				<input type="hidden" name="articleId" value="<%=request.getParameter("articleId")%>" readonly>
			</tr>
            <tr>
                <div id="div1">
				</div>
                <textarea id="text1" name="replyContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
            </tr>
            <tr>
                <td><input type = "submit" name="submit" class="btn bg-gradient-primary" value="發佈"></td>
            </tr>
        </table>
</form>
</div>
<div  style="padding-left:5%">
<table>
				  <thead>
              <tr style="height: 45px;">
                <th >ReplyId</th>
                <th > 內文</th>
                <th > 時間</th>
                <th > 使用者</th>
                <th > 操作</th>
              </tr>
            </thead>
			<%
			 List<ArticleReplyBean> articleReply = (List<ArticleReplyBean>)request.getSession().getAttribute("selectReplyAll");
	 		 int i = 1;
			for (ArticleReplyBean articleReplyList : articleReply) {
			%>
			<tbody>
            <tr >
            <td><%=i++%></td>
            <td><%=articleReplyList.getArticleReplyContent()%></td>
            <td><%=TimeTest.transToDate(articleReplyList.getArticleReplyDate())%></td>
            <td><%=articleReplyList.getUser().getUserId()%></td>
            <td colspan="3">
            
              <form action="replyUpdatePage"  method="post">  
 				  <input type="hidden" name="replyId" value="<%= articleReplyList.getArticleReplyId()%>">
                  <button class="btn bg-gradient-primary"  type="submit">Update</button>
                </form> 
           
            <td>
				<form id ="myform<%=i%>" action="replyDelete" method="post">
					   <input type="hidden" name="replyId" value="<%= articleReplyList.getArticleReplyId()%>">
					   <input type="hidden" name="articleId" value="<%= articleReplyList.getArticleId().getArticleId() %>">
					   <input type='button' class="btn bg-gradient-danger"  value='Delete' onclick="del(<%=i%>)"></input>
				</form>
			</td>
			<td>
				<form id ="replyReport<%=i%>" action="replyReport" method="post">
					   <input type="hidden" name="replyId" value="<%= articleReplyList.getArticleReplyId()%>">
					   <input type="hidden" name="articleId" value="<%= articleReplyList.getArticleId().getArticleId() %>">
					   <input type='button' class="btn bg-gradient-danger"  value='舉報' onclick="replyReport(<%=i%>)">
				</form>
				
			</td>
			 </td>
       	    </tr> 
       	    <% } %>
            </tbody>
</table>	
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
<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/Wang.js'></script>
<script>
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
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
		    $("#replyReport"+id).submit();
		  }
		})
	
}
</script>
</body>

</html>