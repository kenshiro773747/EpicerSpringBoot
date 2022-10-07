<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.epicer.model.course.*,com.epicer.controller.*,
com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
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
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
		<!-- ////////////////// 個人主文開始 //////////////////-->

		<%
		TimeTest TT = new TimeTest();
		Date date = new Date();
		String stringDate = TT.TransDateToString(date);
		%>

		<h1>新增課程</h1>
		<div class="p-4 bg-secondary">

			<form:form action="addCourse" method="post" modelAttribute="Course"
				enctype="multipart/form-data">
				<table>
					<!-- courseName -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程名稱:</label></td>
								<td><form:input type="text" path="courseName"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="請輸入課程名稱" /></td>
							</div>
						</div>
					</tr>

					<!-- coursePrice -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程價錢：</label></td>
								<td><form:input type="text" path="coursePrice"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="請輸入課程價錢" /></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- courseDescription -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程介紹：</label></td>
								<td><form:textarea type="textarea" path="courseDescription"
										class="form-control" id="exampleFormControlTextarea1"
										cols="40" rows="5" style="resize:none" placeholder="請輸入課程描述"></form:textarea></td>
							</div>
						</div>
						</div>
					</tr>


					<!-- courseDate -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程日期：</label></td>
								<td><form:input type="date" path="fakeCourseDate"
										min="<%=stringDate%>" /></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- teacherId -->
					<!--  <tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>老師ID：</label></td>
								<td><form:input type="text" path="fakeTeacherID"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="name@example.com" /></td>
							</div>
						</div>
						</div>
					</tr>-->

					<!-- 測試下拉式選單 -->
					<tr>
						<div class="form-group">
							<td><label>老師：</label></td>
							<td><form:select path="fakeTeacherID"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1">
									<option>可選的老師</option>
									<%
									List<Teacher> list = (List<Teacher>) request.getAttribute("listAll");
									for (Teacher t : list) {
									%>
									<option><%=t.getTeacherId()%></option>
									<%
									}
									%>

								</form:select></td>
						</div>
					</tr>

					<!-- classroomId -->
					<tr>
						<div class="form-group">
							<td><label>教室：</label></td>
							<td><form:select path="classroomId"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option>可選的教室</option>
									<option>101</option>
									<option>102</option>
									<option>103</option>
								</form:select></td>
						</div>
					</tr>


					<!--  <tr>
				<td><label>教室ID：</label></td>
				<td><form:input type="text" path="classroomId" /></td>
			</tr>-->

					<!-- courseStyle -->
					<tr>
						<div class="form-group">
							<td><label>課程類別：</label></td>
							<td><form:select path="courseStyle"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option>請選擇類別</option>
									<option>技術類</option>
									<option>主食類</option>
									<option>甜點類</option>
									<option>節慶套餐類</option>
								</form:select></td>
						</div>
					</tr>


					<!-- image -->
					<tr>
						<td><label>課程圖片：</label></td>
						<td><input type="file" name="photo"
							class="form-control form-control-alternative" id="Ann"
							placeholder="name@example.com" /></td>
						<td><img width=200 id="gmi" src=""></td>
					</tr>




					<tr>
						<td colspan="8"><button type="submit" value="Send"
								class="btn bg-gradient-primary">提交新增</button></td>
					</tr>


					<tr>
						<div id="container">
							<td><label>ckeditor：</label></td>
							<td><form:textarea id="editor" type="textarea"
									path="courseckeditor" ></form:textarea><td>
						</div>
					</tr>



				</table>
			</form:form>
		</div>

		<!--  <div id="container">
			<div id="editor"></div>
		</div>-->



		<style>
#container {
	width: 1000px;
	margin: 20px auto;
}

.ck-editor__editable[role="textbox"] {
	/* editing area */
	min-height: 200px;
}

.ck-content .image {
	/* block images */
	max-width: 80%;
	margin: 20px auto;
}
</style>






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

	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#Ann').on('change', function(e) {
				const file = this.files[0];//將上傳檔案轉換為base64字串
				const fr = new FileReader();//建立FileReader物件
				fr.onload = function(e) {
					$('#gmi').attr('src', e.target.result);//读取的结果放入圖片
				};
				// 使用 readAsDataURL 將圖片轉成 Base64
				fr.readAsDataURL(file);
			});
		});
	</script>




	<!-- ckeditor -->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>
	<!--
            Uncomment to load the Spanish translation
            <script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/translations/es.js"></script>
        -->
	<script>
            // This sample still does not showcase all CKEditor 5 features (!)
            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
                toolbar: {
                    items: [
                        'exportPDF','exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: 'Welcome to CKEditor 5!',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
                    'MathType'
                ]
            });
        </script>
        
        <!-- ckeditor結束 -->

</body>

</html>