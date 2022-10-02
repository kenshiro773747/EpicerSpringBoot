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
    
    
   editor.config.showLinkImg = false
     
     editor.config.excludeMenus = [
        'video',
        'table',
    ]
    
    
    $("#testReset").on("click",function(){
		editor.txt.clear();
})

   $("#UpdateReset").on("click",function(){
	document.getElementById('title').value="";
		editor.txt.clear();
		
})
    

    

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
    editor.config.uploadImgMaxSize = 50 * 1024 * 1024 // 50M
    editor.config.uploadImgMaxLength = 10 // 一次最多上传 10 个图片

    editor.create();//创建在所有配置之后
    