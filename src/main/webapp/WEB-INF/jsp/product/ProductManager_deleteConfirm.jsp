<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.epicer.model.*"%>
<!DOCTYPE html>
<%


response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>商品管理</title>
<link data-turbolinks-track="true"
            href="http://static.oswd.org/assets/application-6d2a4562b1f5d344541d91ef6d0c8e9a.css" media="all"
            rel="stylesheet">
<style>

#nav {

            text-align: center;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            z-index: 10000;
            cursor: default;
            height: 4em;
            line-height: 3.5em;
            background-color: white;
        }

        #nav ul {
            margin-bottom: 0;
            list-style: none;
            padding-left: 0;
        }

        #nav li {
            display: inline-block;
            padding-left: 0;
        }

        #nav a {
            -moz-transition: background-color .2s ease-in-out;
            -webkit-transition: background-color .2s ease-in-out;
            -ms-transition: background-color .2s ease-in-out;
            transition: background-color .2s ease-in-out;
            position: relative;
            display: block;
            text-decoration: none;
            outline: 0;
            font-weight: 600;
            border-radius: 8px;
            color: black;
            height: 2.5em;
            line-height: 2.5em;
            padding: 0 1.25em;
        }

        #nav a:hover {
            color: #fff !important;
            background: #7f987e;
        }

        #nav a.active {
            background: #484848;
        }

        #nav a.active:before {
            content: '';
            display: block;
            position: absolute;
            bottom: -0.6em;
            left: 50%;
            margin-left: -0.75em;
            border-left: solid 0.75em transparent;
            border-right: solid 0.75em transparent;
            border-top: solid 0.6em #282828;
        }




fieldset {
	width: 500px;
	border: 1px solid wheat;
	border-radius: 15px;
	margin: 15px auto;
	background-color: rgb(230, 230, 255);
}

legend {
	color: blue;
	text-align: center;
}

.st1 {
	width: 470px;
	margin: 20px;
	padding-bottom: 10px;
}

.button {
	width: 450px;
	margin: 20px;
	text-align: center;
}

.t1 {
	width: 120px;
	float: left;
	text-align: right;
}
</style>
</head>

<body>
	<jsp:useBean id="productBean" class="com.epicer.model.product.Product" scope="session" />

	<nav id="nav">
        <ul class="container">
            
            <li><a href="productlist">回商品頁</a></li>
        </ul>
    </nav>
      <br><br><br>
      
	<form action="deleteProductAction" method="post">

		<fieldset>
			<h1 ALIGN=CENTER>商品管理</H1>
			
			<input type="hidden" name="id" value=<%=request.getParameter("id")%>>
			
			<div class="st1">
				<label for="name" class="t1">商品名稱:</label>
				 <%=request.getParameter("name")%>
				 <input type="hidden" name="name" value=<%=request.getParameter("name")%>>
			</div>
			<div class="st1">
				<label for="description" class="t1">商品描述:</label>
				<%=request.getParameter("description")%>
				<input type="hidden" name="description" value=<%=request.getParameter("description")%>>
			</div>
			<div class="st1">
				<label for="category" class="t1">商品類別:</label>
				<% 
				if (request.getParameter("category").equals("1")) {
					out.println("五穀根莖類");
				} else if (request.getParameter("category").equals("2")) {
					out.println("奶類");
				} else if (request.getParameter("category").equals("3")) {
					out.println("蛋豆魚肉類");
				} else if (request.getParameter("category").equals("4")) {
					out.println("蔬菜類");
				} else if (request.getParameter("category").equals("5")) {
					out.println("水果類");
				} else if (request.getParameter("category").equals("6")) {
					out.println("油脂與堅果種子類");
				} else if (request.getParameter("category").equals("7")) {
					out.println("調味品類");
				} else {
					out.println("無法辨別");
				}
		        %>
		        <input type="hidden" name="category" value=<%=request.getParameter("category")%>>

			</div>
			<div class="st1">
				<label for="unit" class="t1">單位:</label>
				<%= request.getParameter("unit") %>
				<input type="hidden" name="unit" value=<%=request.getParameter("unit")%>>
			</div>
			<div class="st1">
				<label for="price" class="t1">價格:</label>
								<%= request.getParameter("price") %>
				<input type="hidden" name="price" value=<%=request.getParameter("price")%>>
			</div>
			<div class="st1">
				<label for="origin" class="t1">產地:</label>
				<%= request.getParameter("origin") %>
				<input type="hidden" name="origin" value=<%=request.getParameter("origin")%>>
			</div>
			<div class="button">
			    <input type="hidden" name="action" value="deleteConfirm" >
				<input type="submit" value="確定刪除" > 
			</div>
		</fieldset>
		</form>
</body>
</html>