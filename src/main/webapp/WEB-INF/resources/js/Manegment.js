$(function(){

    $('#myfile').on('change', function(e){      
  const file = this.files[0];//將上傳檔案轉換為base64字串
      
  const fr = new FileReader();//建立FileReader物件
  fr.onload = function (e) {
    $('img').attr('src', e.target.result);//读取的结果放入圖片
  };
      
 // 使用 readAsDataURL 將圖片轉成 Base64
  fr.readAsDataURL(file);
});


$('#password').on('blur',
    function(){
        checkPassword()
    }
    )
       
    function checkPassword(){
        let password = $('#password').val()
                if(typeof password === "string"){
                    if (password ==null || password ==""){
                var msg = "密碼必須填寫";  
                $('#sp1').text(msg);  
                return false
            }else{
                 var eng =new RegExp("[a-zA-z]"); //要改成有中文不行
                 if(eng.test(password)){
                     if(password.length <=7 || password.length >=17){
                         var msg="密碼須為8至16字含英文數字";  
                         $('#sp1').text(msg);  
                return false                    
                        }else{
                            var msg="OK ";
                            $('#sp1').text(msg);  
                return true
                        }
                }else{
                var msg ="密碼須為8至16字含英文數字";
                $('#sp1').text(msg);  
                return false
            }
    
        }
    } else{
        var msg="密碼須為8至16字含英文數字";  
        $('#sp1').text(msg);  
                return false   
    }
    }

//檢查電話  判斷 非空/不能有中文+英文/開頭為09/
$('#phone').on('blur', function(){
    checkPhone()
    })
    
    
    function checkPhone(){
            var phone = $('#phone').val();
            if(typeof phone === "string"){
            if(phone == null || phone ==""){
                var msg="連絡電話必填"
                $('#sp2').text(msg);
                return false
            }else{
                var chinese =new RegExp("[\u4E00-\u9FA5]+");
                var eng =new RegExp("[A-Za-z]+");
                if(chinese.test(phone) || eng.test(phone)){
                    var msg = "請輸入有效電話號碼"
                    $('#sp2').text(msg);
                return false
                }else{
                    if(phone.indexOf('0') == 0 && phone.indexOf('9') == 1){
                    if(phone.length < 10 || phone.length > 10){
                        var msg = "請輸入有效號碼"   
                        $('#sp2').text(msg);
                return false
                    }else{
                        var msg = "ok"   
                        $('#sp2').text(msg);
                return true
                    }
                    }else{
                        var msg = "請輸入手機號碼"  
                        $('#sp2').text(msg);
                return false
                    }
                }
            }
            }else{
                var msg = "請輸入有效電話號碼" 
                $('#sp2').text(msg);
                return false  
            }
        }





//居住城市必填 判斷 必選 觸發 onblur onsubmit
let city = document.querySelector("#city");  //select
    city.addEventListener("blur", selectcity);
    
     function selectcity() {
      const result = city.options[city.selectedIndex].value;
      if(result == 0){
     var msg= "居住城市必填";
          $('#sp3').text(msg);
          return false;
    }else{
      var msg= "OK";
          $('#sp3').text(msg);
          return true;
    }
    
    }
    
    
    //居住區域必填 非空  觸發 onblur onsubmit
    $('#township').on('blur',function(){
        checkTownship()
    })
    
    
    function checkTownship(){
        let township = $('#township').val()
        if(typeof township ==="string"){
            if(township == null  || township == "" ){
                var msg ="區域必填";
                $('#sp4').text(msg)
                return false
            }else{
                var msg ="ok";
                $('#sp4').text(msg)
                return true
            }
        }else{
            var msg ="區域必填";
            $('#sp4').text(msg)
                return false
        }
       
      }
    
    
     //居住路段必填 判斷 非空 觸發 onblur onsubmit
         $(".twzipcode").on('change',function(){
          let county = twzipcode.get('county');
   		  let district = twzipcode.get('district');
   		  $('#road').attr("value",county+district);
        });
        
        
        $('#road').on('blur',function(){
        checkRoad()
        });
        
        
        function checkRoad(){
            let road = $('#road').val()
            if(typeof road ==="string"){
                if(road == null  || road == "" ){
                    var msg ="路段必填";
                    $('#sp9').text(msg)
                    return false
                }else{
                    var msg ="ok";
                    $('#sp9').text(msg)
                    return true
                }
            }else{
                var msg ="請輸入有效字元";
                $('#sp9').text(msg)
                return false
            }
          
          }
          })