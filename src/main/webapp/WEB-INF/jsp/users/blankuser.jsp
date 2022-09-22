<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenav.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方 (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->


<!-- ////////////////// 個人主文開始 //////////////////-->

		
    <div class="container">
<div class="forms">
<div class="form loign">
<span class="title">Login</span>
<form action="login" method="post">
    <div class="inputfeild">
        <input type="text" name="account" id="account" placeholder="Enter your EmailAccount" required>
        <i class="uil uil-envelope-alt icon"></i>
    </div>
    <span id="sp1" class="msg"></span>
    <div class="inputfeild">
        <input type="password" name="password" id="password" placeholder="Enter your Password" required>
        <i class="uil uil-padlock"></i>
        <i class="uil uil-eye-slash showhidepw"></i>
    </div>
    <span id="sp2" class="msg"></span>
    <div class="checkboxtext">
        <div class="checkboxcontent">
            <input type="checkbox" id="logcheck">
            <label for="logcheck" class="text">Remember Me</label>
        </div>
        <a fref="#" class="text">Forget Password?</a>
    </div>
    <div class="inputfeild button">
        <input type="submit" value="Login Now">
    </div>
</form>
<div class="loginsignup">
    <span class="text">Not A Member</span>
    <a href="form" class="text signuptext">Sign Up Now</a>
</div>
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
	
<script src="js/jquery-3.6.0.js"></script>
<script src="js/login.js"></script>

</body>

</html>