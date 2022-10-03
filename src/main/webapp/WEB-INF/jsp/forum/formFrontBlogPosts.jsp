<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ////// 這是多頁文章的串聯頁面  /////// -->
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

span{
position: relative;
 overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  max-width: 140px;
  display: inline-block;
  height:20px;
}

.multiline-ellipsis { 
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
  overflow: hidden;
}

.post{
 border: 2px gray solid;
 border-radius: 30px;
}

.pic {
  width: 500px;
  height: 350px;
  margin: 50px;
  border: 2px solid;
}
.pic img {
  object-fit: contain;
  width: 500px;
  height: 350px;
}

</style>

<script>
$(document).ready(function(){
	queryAll();
});

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
					var o =0;
					for(var i=0;i<data.length;i++){
						o++;
						var time = new Date(data[i].date);
						if(data[i].status==1){
						resultText +=
							 "<tr style='background-color:#FFD494'>"+
						        "<div>"+
						        "<td>"+
						        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
						     " </button>"+
						      <!-- Modal -->
						      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
						        "<div class='modal-dialog'>"+
						          "<div class='modal-content'>"+
						          "  <div class='modal-header'>"+
						             " <h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
						             
						            "  <button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
						          "  </div>"+
						           " <div class='modal-body'>"+
						           data[i].articleContent+
						           " </div>"+
						           " <div class='modal-footer'>"+
						            " <button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
						            "<form action='articleDetail' method='post'>"+
									"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
									"<button type='submit' class='btn bg-gradient-primary'>查看文章</button>"+
									"</form>"+
						           "</button>"+
						           " </div>"+
						         " </div>"+
						       " </div>"+
						    "  </div>"+
						 "</div>"+
						          
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
									
										"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
										"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
										"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
									    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						          "</td>"+
						        "</tr>"
						   
					   }else if(data[i].status==0){
						   resultText +=
							   "<tr>"+
						        "<div>"+
						        "<td>"+
						        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
							     " </button>"+
							      <!-- Modal -->
							      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
						        "<div class='modal-dialog'>"+
						          "<div class='modal-content'>"+
						          "  <div class='modal-header'>"+
						             " <h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
						            "  <button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
						          "  </div>"+
						           " <div class='modal-body'>"+
						           data[i].articleContent+
						           " </div>"+
						           " <div class='modal-footer'>"+
						            " <button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
						            "<form action='articleDetail' method='post'>"+
									"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
									"<button type='submit' class='btn bg-gradient-primary'>查看文章</button>"+
									"</form>"+
						           "</button>"+
						           " </div>"+
						         " </div>"+
						       " </div>"+
						    "  </div>"+
						 "</div>"+
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
								"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
								"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
								
					          "</td>"+
					        "</tr>"
					   
					}
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
					var o=0;
					for(var i=0;i<data.length;i++){
						o++;
						var time = new Date(data[i].date);
						if(data[i].status==1){
							resultText +=
								  "<tr style='background-color:#FFD494'>"+
						          "<td>"+
						            "<div>"+
							        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
								     " </button>"+
								      <!-- Modal -->
								      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
							            "<div  class='modal-dialog'>"+
							             " <div class='modal-content'>"+
							              " <div class='modal-header'>"+
							               "<h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
							                 "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
							                "</div>"+
							                "<div class='modal-body'>"+
							                data[i].articleContent+
							              "</div>"+
							               " <div class='modal-footer'>"+
							                "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
							                "<form action='articleDetail' method='post'>"+
											"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
											"<button type='submit' class='btn btn-primary'>進入文章</button>"+
											"</form>"+
							               " </div>"+
							            "  </div>"+
							            "</div>"+
							          "</div>"+
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
								"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
								"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
								"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
							    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
					          "</td>"+
					        "</tr>"
					   
				   }
						else if(data[i].status==0){
							resultText +=
								  "<tr>"+
						          "<td>"+
						            "<div>"+
							        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
								     " </button>"+
								      <!-- Modal -->
								      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
							            "<div  class='modal-dialog'>"+
							             " <div class='modal-content'>"+
							              " <div class='modal-header'>"+
							               "<h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
							                 "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
							                "</div>"+
							                "<div class='modal-body'>"+
							                data[i].articleContent+
							              "</div>"+
							               " <div class='modal-footer'>"+
							                "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
							                "<form action='articleDetail' method='post'>"+
											"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
											"<button type='submit' class='btn btn-primary'>進入文章</button>"+
											"</form>"+
							               " </div>"+
							            "  </div>"+
							            "</div>"+
							          "</div>"+
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
									"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
									"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
									"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
								    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
						          "</td>"+
						        "</tr>"
						}
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
				var o =0;
				for(var i=0;i<data.length;i++){
					o++
					var time = new Date(data[i].date);
					if(data[i].status==1){
						resultText +=
							  "<tr style='background-color:#FFD494'>"+
					          "<td>"+
					            "<div>"+
						        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
							     " </button>"+
							      <!-- Modal -->
							      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
						            "<div  class='modal-dialog'>"+
						             " <div class='modal-content'>"+
						              " <div class='modal-header'>"+
						               "<h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
						                 "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
						                "</div>"+
						                "<div class='modal-body'>"+
						                data[i].articleContent+
						              "</div>"+
						               " <div class='modal-footer'>"+
						                "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
						                "<form action='articleDetail' method='post'>"+
										"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
										"<button type='submit' class='btn btn-primary'>進入文章</button>"+
										"</form>"+
						               " </div>"+
						            "  </div>"+
						            "</div>"+
						          "</div>"+
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
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
				          "</td>"+
				        "</tr>"
				   
			   }else if(data[i].status==0){
					resultText +=
						  "<tr>"+
				          "<td>"+
				            "<div>"+
					        "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop"+o+"'>"+(i+1)+
						     " </button>"+
						      <!-- Modal -->
						      "<div class='modal fade' id='staticBackdrop"+o+"' data-bs-backdrop='static' data-bs-keyboard='false' tabindex='-1' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"+
					            "<div  class='modal-dialog'>"+
					             " <div class='modal-content'>"+
					              " <div class='modal-header'>"+
					               "<h5 class='modal-title' id='staticBackdropLabel'>"+data[i].title+"</h5>"+
					                 "<button type='button' class='btn-close' data-bs-dismiss='modal' aria-label='Close'></button>"+
					                "</div>"+
					                "<div class='modal-body'>"+
					                data[i].articleContent+
					              "</div>"+
					               " <div class='modal-footer'>"+
					                "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>關閉</button>"+
					                "<form action='articleDetail' method='post'>"+
									"<input type='hidden' name='articleId' value='"+data[i].articleId+"'>"+
									"<button type='submit' class='btn btn-primary'>進入文章</button>"+
									"</form>"+
					               " </div>"+
					            "  </div>"+
					            "</div>"+
					          "</div>"+
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
							"<input type='hidden' name='number' id ='number"+i+"' value="+data[i].articleId+">"+
							"<input type='hidden' name='articleId' id ='articleID"+i+"' value="+data[i].articleId+">"+
							"<button type='button' class='btn btn-outline-warning' onclick='del("+i+")'>刪除</button>"+
						    "<button type='button' class='btn btn-outline-warning' onclick='report("+i+")'>檢舉</button>"+
				          "</td>"+
				        "</tr>"
				}
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
			  var xhr = new XMLHttpRequest();
		    	xhr.open("post","articleDelete",true);
		    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
		    	var articleId = document.getElementById("articleID"+id).value;
		    	var number = document.getElementById("number"+id).value;
		    	xhr.send("number="+number);
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    ).then((result) => {
		    	queryAll();
		    })
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
	    	var xhr = new XMLHttpRequest();
	    	xhr.open("post","forumReport",true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded") ;
	    	var number = document.getElementById("number"+id).value;
	    	xhr.send("number="+number);
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		      
		    ).then((result) => {

		    	queryAll();
		    })
		  }
		})
	
}



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
						"<div class='post'>"+
					"<h1 class='post-title' style='font-size: 28px'><a href='blog-single.html'>"+data[i].title+"</a></h1>"+
					"<div class='post-content multiline-ellipsis pic' style='height:350px'>"+
					data[i].articleContent+
					"</div>"+
					"<div class='post-meta'>"+
						"<ul>"+
							"<li style='font-size: 18px'>"+
							"<i class='tf-ion-ios-calendar'></i>"+time.toLocaleString()+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-ios-heart'></i>收藏數"+data[i].articleLike+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-chatbubbles'></i>留言數"+data[i].articleReplys+
							"</li>"+
							"<li style='font-size: 18px'>"+
								"<i class='tf-ion-android-person'></i>觀看數"+data[i].articleViews+
							"</li>"+
						"</ul>"+
					"</div>"+
				"</div>"
				  
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











</script>    
    
<!-- ////// 連動到單頁的文章風格(1)  /////// -->
<!-- <div class="post"> -->
<!-- 	<h1 class="post-title" style="font-size: 28px"><a href="blog-single.html">How To Wear Bright Shoes</a></h1> -->
<!-- 	<div class="post-content"> -->
<!-- 		文章內容 -->
<!-- 	</div> -->
<!-- 	<div class="post-meta"> -->
<!-- 		<ul> -->
<!-- 			<li> -->
<!-- 				<i class="tf-ion-ios-calendar"></i>日期 -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<i class="tf-ion-android-person"></i>使用者name -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<i class="tf-ion-chatbubbles"></i> 收藏數 -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<i class="tf-ion-chatbubbles"></i> 留言數 -->
<!-- 			</li> -->
<!-- 			<li> -->
<!-- 				<i class="tf-ion-chatbubbles"></i> 觀看數 -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	
<!-- </div> -->


<div class="input-group mb-3" style="padding:0 5%">
  <input type="text"  name="searchTitle" id ="searchTitle" class="form-control" placeholder="Article title" aria-label="Recipient's username" aria-describedby="button-addon2">
  <button class="btn btn-outline-primary mb-0" style="background-color: #f4f5f7" type="button" id="button-addon2" onclick="querytitle()">查詢文章</button>
</div>
<div id ="mydiv"></div>


<!-- ////// 分頁跳轉  /////// -->
<div class="text-center">
	<ul class="pagination post-pagination">
		<li><a href="#!">Prev</a>
		</li>
		<li class="active"><a href="#!">1</a>
		</li>
		<li><a href="#!">2</a>
		</li>
		<li><a href="#!">3</a>
		</li>
		<li><a href="#!">4</a>
		</li>
		<li><a href="#!">5</a>
		</li>
		<li><a href="#!">Next</a>
		</li>
	</ul>
</div>