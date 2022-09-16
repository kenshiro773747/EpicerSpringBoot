	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");

response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<title>新增文章</title>
<!-- <script src="https://cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script> -->
<script language='javascript' src='js/wangEditor.min.js'></script>
<style>
        .tb1 {
            width: 700px;
            height: 550px;
            border: 1px solid black;
            border-collapse: collapse;
            margin: auto;
        }

        td,
        th {

            border: 1px solid #BEC9A6;
        }
        
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            min-height: 400px;
        }
   
        
</style>


    
</head>

<body>

    <h1 style="text-align:center;">新增文章 </h1>
    <hr>




    <form action="articleAdd" method="post">
        <table class="tb1">
            <tr>
                <td>文章類型</td>
                <td>
                    <select name="category" >
                        <option value="0" selected disabled >請選擇文章類型</option>
                        <option value="1">全穀雜糧類</option>
                        <option value="2">豆魚蛋肉類</option>
                        <option value="3">蔬菜類</option>
                        <option value="4">水果類</option>
                        <option value="5">乳品類</option>
                        <option value="6">油脂與堅果種子類</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>文章標題</td>
                <td><input type="text" name="articleTitle" required="required"></td>

            </tr>
            <tr>
            
                <td>文章內容</td>
                <td>
                <div id="div1">
				</div>
                <textarea id="text1" name="articleContent" style="width:100%; height:200px ;display:none" cols="80" rows="20" required="required" ></textarea>
                </td>

            </tr>
            
            <tr>
                <td><input type="submit" name="submit" value="保存"></td>
                <td><input type="reset" value="清除表單"></td>
            </tr>



        </table>
    </form>
    
<!-- <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->
<script language='javascript' src='js/jquery-3.6.0.js'></script>
<script language='javascript' src='js/Wang.js'></script>
</body>

</html>