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
<style>
table{
text-align: center;
margin-left:150px;
background: white;
border: 1px solid transparent;
border-radius: 5px;

}



.popup-overlay {
visibility:hidden;
}

.popup-content {
visibility:hidden;
}


.popup-overlay.active{
visibility:visible;
}

.popup-content.active {
visibility:visible;
}


.flip-card {
  background-color: transparent;
  width: 250px;
  height: 150px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  margin-top:50px;
  margin-bottom: 50px
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
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
<div class="flip-card" style="float:left;margin-left:100px;">
  <div class="flip-card-inner">
    <div class="flip-card-front">
     <img src="images/logo.png" alt="Avatar" style="width:250px;height:150px;">
    </div>
    <div class="flip-card-back" >
      <br>
      <h6 >總註冊人數</h6>
      <p id="p1">Architect & Engineer</p>
    </div>
  </div>
</div>


<div class="flip-card" style="float:left;margin-left:15px">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <img src="images/logo.png" alt="Avatar" style="width:250px;height:150px;">
    </div>
    <div class="flip-card-back">
    <br>
       <h6>今日登錄人數</h6>
      <p id="p2">Architect & Engineer</p>
    </div>
  </div>
</div>


<div class="flip-card" style="float:left;margin-left:15px">
  <div class="flip-card-inner">
    <div class="flip-card-front">
     <img src="images/logo.png" alt="Avatar" style="width:250px;height:150px;">
    </div>
    <div class="flip-card-back">
    <br>
         <h6>昨日登錄人數</h6>
      <p id="p3">Architect & Engineer</p>
    </div>
  </div>
</div>

<div style="margin-top:150px;Clear: left">
<select id="chose" style="margin-left:100px">
<option value="1">性別統計</option>
<option value="2">年齡統計</option>
<option value="3">地區統計</option>
</select>
<select id="append">
</select>
<button name="preview" id="preview" class="open" style="margin-left:150px">預覽</button><span id="export">&ensp;</span>
</div>
<!--Creates the popup body-->
<div class="popup-overlay">
<!--Creates the popup content-->
 <div class="popup-content">  
 <button class="close" style="margin-left:150px">Close</button>  
</div>
</div>

<hr>
<div style="width:100%;max-width:1300px;margin-left:100px;background-color: white;border-radius: 5px;opacity:0.9">年齡分布圖</div>
<div>
<canvas id="myChart2"  style="width:100%;max-width:1300px;margin-left:100px;background-color: white;border-radius: 5px;opacity:0.9"></canvas>
</div>
<hr>

<div style="margin-left:100px">
<canvas id="myChart" style="width:100%;max-width:400px;height:400px;background-color: white;border-radius: 5px;opacity:0.9;float:left"  ></canvas>
<canvas id="myChart3" id="myChart2"  style="width:100%;max-width:400px;height:400px;background-color: white;border-radius: 5px;opacity:0.9"></canvas>
</div>

<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->s

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
<script>
$(function(){
	
	/***********************************************************************/		
	queryGender(); //性別比
	queryAge();  //年齡層
	queryCity(); //區域
	queryUserAmount();
	queryLoginAmount();
	queryKinoLoginAmount();
	
	/*******************************昨日登錄人數****************************************/	
	function queryKinoLoginAmount(){
		$.ajax({
			  type:"POST",
			  url:'/kinologinamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log('這xu3dsdsd'+res);
		     $('#p3').html(res+'人');
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************今日登錄人數****************************************/		
	function queryLoginAmount(){
		$.ajax({
			  type:"POST",
			  url:'/loginamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log('這xu3'+res);
		     $('#p2').html(res+'人');
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************總註冊人數/singupamount"****************************************/	
	function queryUserAmount(){
		$.ajax({
			  type:"POST",
			  url:'/usersamount',
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log('這'+res);
		     $('#p1').html(res+'人');
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax		
	}
	/*******************************區域****************************************/	
	function queryCity(){
		
		$.ajax({
			  type:"GET",
			  url:"/city",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log(res);
		       console.log(res.north);
		       
		       
		       const data = {
		 			  labels: [
		 			    '北部(基隆市、臺北市、新北市、桃園市、新竹市、新竹縣)',
		 			    '中部(苗栗縣、臺中市、彰化縣、南投縣、雲林縣)',
		 			    '南部(嘉義市、嘉義縣、臺南市、高雄市)',
		 			    '東部(屏東縣、臺東縣、花蓮縣、宜蘭縣)',
		 			    '離島(澎湖縣、金門縣、連江縣)'
		 			  ],
		 			  datasets: [{
		 			    label: '居住地分布',
		 			    data: [res.north, res.center,res.south, res.east, res.island],
		 			    backgroundColor: [
		 			      'rgb(255, 99, 132)',
		 			      'rgb(75, 192, 192)',
		 			      'rgb(255, 205, 86)',
		 			      'rgb(201, 203, 207)',
		 			      'rgb(54, 162, 235)'
		 			    ]
		 			  }]
		 			};
		 	
		 	
		 	
		 	new Chart("myChart3", {
		 			  type: 'polarArea',
		 			  data: data,
		 			  options: {}
		 			});
		       
		       
		     
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax	
	}
	
	/*******************************年齡****************************************/	
	
	function queryAge(){
		$.ajax({
			  type:"GET",
			  url:"/age",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				  console.log(res);
		       console.log(res.sixty);
		       var eighteen =res.eighteen
		       var twenty =res.ninteen
		       var fourty =res.fourty
		       var fifty =res.fivty
		       var sixty =res.sixty
		       
		   	const data = {
		    			  labels:  ['18~28歲', '29~39歲', '40~50歲', '51~61歲', '61歲以上'],
		    			  datasets: [{
		    			    axis: 'y',
		    			    label: '該年齡人數',
		    			    data: [ eighteen, twenty, fourty, fifty, sixty],
		    			    fill: false,
		    			    backgroundColor: [
		    			      'rgba(255, 99, 132, 0.2)',
		    			      'rgba(255, 159, 64, 0.2)',
		    			      'rgba(255, 205, 86, 0.2)',
		    			      'rgba(75, 192, 192, 0.2)',
		    			      'rgba(54, 162, 235, 0.2)',
		    			    ],
		    			    borderColor: [
		    			      'rgb(255, 99, 132)',
		    			      'rgb(255, 159, 64)',
		    			      'rgb(255, 205, 86)',
		    			      'rgb(75, 192, 192)',
		    			      'rgb(54, 162, 235)',
		    			    ],
		    			    borderWidth: 1
		    			  }]
		    			};

		    			
		    			
		    			new Chart("myChart2",  {
		    				  type: 'bar',
		    				  data,
		    				  options: {
		    				    indexAxis: 'y',
		    				  }
		    				});
		       
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax	
	}
	
	/*********************************性別**************************************/
	
	function queryGender(){	
		var user = 0;
		$.ajax({
			  type:"GET",
			  url:"/gender",
			  contentType:'application/json',
		       //data:JSON.stringify(user),
			  success:function(res){
				 var male = res.code;
				 var female =res.object;
				 console.log(male)
				 
				 	 const data = {
				  labels: [
				    '女性',
					 '男性', 
				  ],
				  datasets: [{
				    label: '用戶性別比',
				    data: [female, male,],
				    backgroundColor: [
				      'rgb(255, 99, 132)',
				      'rgb(54, 162, 235)',
				    ],
				    hoverOffset: 4
				  }]
				};

		new Chart("myChart", {
			  type: 'doughnut',
			  data: data,
		})
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	}
	
	/**********************************各個選項*************************************/	
	
	$('#chose').on('change',function(){
		var chose= $('#chose').val();
		console.log(chose);
		if(chose==1){
			$( ".age" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="gender" value="male">男性</option><option class="gender" value="female">女性</option>');	
			return;
		}else if(chose==2){
			$( ".gender" ).remove();
			$( ".city" ).remove();
			$('#append').append('<option class="age" value="eighteen">18-28歲</option><option class="age" value="twenty">29-39歲</option><option class="age" value="fourty">40-50歲</option><option class="age" value="fifty">51-61歲</option><option class="age" value="sixty">61歲以上</option>');		
		return;
		}else{
			$( ".age" ).remove();
			$( ".gender" ).remove();
			$('#append').append('<option class="city" value="north">北部</option><option class="city" value="center">中部</option><option class="city" value="south">南部</option><option class="city" value="east">東部</option><option class="city" value="island">離島</option>');	
			return;
		}
	}); //change

	/*********************************查詢分流**************************************/	
	$('#preview').on('click',function(){
		var chose = $('#chose').val()
		console.log(chose)
		if(chose==1){
			genderPreview();
		}else if (chose==2){
			genderPreview();
		}else{
			genderPreview();
		}
	})
	
	
	/*********************************年齡預覽*************************************/
	

	
	
	
/***********************************性別預覽************************************/	
	function genderPreview(){
		$(".popup, .popup-content").addClass("active");
		var app = $('#append').val()
		console.log(app);
		$.ajax({
			  type:"PUT",
			  url:"/gendertable",
			  contentType:'application/json',
		      data:app,
			  success:function(res){
				 resulttext=""
				console.log(res)
				var d = new Date(res[0].birth).toLocaleDateString();
				 console.log(d)
				for(let i=0;i<res.length;i++){
					
					var strd = new Date(res[i].birth).toLocaleDateString();
					var strl = new Date(res[i].logindate).toLocaleDateString();
						
					var row=
					'<tr>'
					+'<td>'+res[i].id+'</td>'
					+'<td>'+res[i].status+'</td>'
					+'<td>'+res[i].name+'</td>'
					+'<td>'+res[i].gender+'</td>'
					+'<td>'+res[i].account+'</td>'
					+'<td>'+strd+'</td>'
					+'<td>'+res[i].phone+'</td>'
					+'<td>'+res[i].address+'</td>'
					+'<td>'+strl+'</td>'
					+'<td>'+" "+'</td>'
					+'</tr>'
					resulttext+=row;
				}
                   var table='<table id="previewtable">'				 
				 
				$('.popup-content').append(table+'<tr><th>ID</th> <th>權限</th> <th>姓名</th> <th>性別</th> <th>帳號</th> <th>出生/年/月/日</th>  <th>聯絡電話</th><th>完整地址</th> <th>上次登錄</th> <th>備註</th> </tr>'+resulttext+'</table>');
				$('.popup-content').css("display", "block");
			  },//success
			  error:function(err){console.log(err)},
		  }); //ajax
	}
	
/********************************彈跳視窗***************************************/
	
	$(".close, .popup").on("click", function(){
		$('#previewtable').remove();
		$(".popup, .popup-content").removeClass("active");
		});//click
	
	
/*******************************匯出檔案****************************************/	
	$('#append').on("change", function(){
		var a = $('#append').val();
		console.log(a);
		var url='http://localhost:8091/exportcsv/'+a
		var exportcsv='<a href="'+url+'"><button>匯出CSV</button></a>'
	    $('#export').html(exportcsv)
		console.log(exportcsv);
		})//click
}); //底
</script>
</body>

</html>