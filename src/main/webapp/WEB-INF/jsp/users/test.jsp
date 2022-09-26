<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Back</title>
    <link rel="stylesheet" href="css/userindex.css">

</head>
<body style="background-color: antiquewhite">
<%@ include file="../frontincludes/epicerNavbar.jsp" %>
    <div class="action">
        <div class="profile" onclick="menuToggle();">
            <img src="${user.getAvatar()}">
        </div>
            <div class="menu" >
                <h3>${user.getName()}<br><span>お帰りなさい</span></h3>
        <ul>
             <form name="management" method="post" action="management">
            <li><img src="images/user.png"><a href="javascript:document.management.submit();">MyProfile</a></li>
            </form>
             <form name="modify" method="post" action="#">
            <li><img src="images/edit.png"><a href="javascript:document.modify.submit();">Recipe</a></li>
            </form>
            <li><img src="images/envelope.png"><a href="#">Inbox</a></li>
            <li><img src="images/settings.png"><a href="#">Setting</a></li>
            <li><img src="images/question.png"><a href="#">Help</a><</li>
            <form name="logout" method="post" action="logout">
            <li><img src="images/log-out.png"><a href="javascript:document.logout.submit();">Logout</a></li>
            </form>
        </ul>
            </div>
    </div>
 <script>
function menuToggle(){
    const toggleMenu=document.querySelector('.menu');
    toggleMenu.classList.toggle('active')
}

 </script>   
</body>
</html>