	const E = window.wangEditor
		const editor = new E('#div1')
	    const $text1 = $('#text1')
    editor.config.onchange = function (html) {
        // 第二步，监控变化，同步更新到 textarea
        $text1.val(html)
    }
    editor.config.zIndex = 0
    // 第一步，初始化 textarea 的值
    $text1.val(editor.txt.html())
    
    $("#testReset").on("click",function(){
		editor.txt.clear();
})

   $("#UpdateReset").on("click",function(){
	document.getElementById('title').value="";
		editor.txt.clear();
		
})
    

    
//      //開啟debug模式
//         editor.config.debug = true;
//         // 關閉粘貼內容中的樣式
//         editor.config.pasteFilterStyle = false
//         // 忽略粘貼內容中的圖片
//         editor.config.pasteIgnoreImg = true
//         // 使用 base64 保存圖片
//         //editor.customConfig.uploadImgShowBase64 = true

//         // 上傳圖片到服務器
//         editor.config.uploadFileName = 'img'; //設置文件上傳的參數名稱
//         editor.config.uploadImgServer = 'images'; //設置上傳文件的服務器路徑
//         editor.config.uploadImgMaxSize = 3 * 1024 * 1024; // 將圖片大小限制為 3M
//         editor.config.uploadImgTimeout = 50000;
//         //自定義上傳圖片事件
//         editor.config.uploadImgHooks = {
//             before: function(xhr, editor, files) {

//             },
//             success: function(xhr, editor, result) {
//                 console.log("上傳成功");
//             },
//             fail: function(xhr, editor, result) {
//                 console.log("上傳失敗,原因是" + result);
//             },
//             error: function(xhr, editor) {
//                 console.log("上傳出錯");
//             },
//             timeout: function(xhr, editor) {
//                 console.log("上傳超時");
//             }
//         }

 //    设置上传本地图片到服务器
    editor.config.uploadImgServer =  'images';//与后端访问接口保持一致
    editor.config.uploadFileName = 'img'//文件名作为后端接收的参数名
    editor.config.uploadImgHooks = {
        //配置自动插入到编辑器
        customInsert: function (insertImgFn, result) {
            // result 即服务端返回的接口
            // insertImgFn 可把图片插入到编辑器，传入图片 src ，执行函数即可
            insertImgFn(result.data[0])
        }
    }
    //设置图片大小
    editor.config.uploadImgMaxSize = 10 * 1024 * 1024 // 10M
    editor.config.uploadImgMaxLength = 10 // 一次最多上传 10 个图片

    editor.create();//创建在所有配置之后
    