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
<script  src='js/report.js'></script>
<link rel="stylesheet" href="css/sweetalert2.min.css">

<style type="text/css">
.modal-body p{
white-space:pre-wrap;
width:450px;
}
.modal-dialog{

overflow-y: initial !important

}

.modal-body{
overflow-x: hidden;
height: 450px;
overflow-y: auto;

}
	
<div class="main-carousel">
  <div class="carousel-cell">...</div>
  <div class="carousel-cell">...</div>
  <div class="carousel-cell">...</div>
  ...
</div>



script
$('.main-carousel').flickity({
  // options
  cellAlign: 'left',
  contain: true
});





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