package com.epicer.controller.forum;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleReplyBean;
import com.epicer.model.forum.ArticleUserBean;
import com.epicer.service.forum.ArticleReplyService;
import com.epicer.service.forum.ArticleService;
import com.epicer.util.TimeTest;





@Controller
public class ArticleController {
	
	
	@Autowired
	private ArticleService aService;
	
	private ArticleReplyService arService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SessionFactory factory;
	

	@GetMapping("/QueryAllPage")
	public String QueryAllPage() {
		return "forumIndexJsonTest";
	}
	
	
	@GetMapping("/QueryAllAjax")
	@ResponseBody
	public List<ArticleBean> QueryAllAjax() {
		return aService.findAll();
	}
	
	@PostMapping("/QueryNameAjax")
	@ResponseBody
	public List<ArticleBean> QueryNameAjax(String title) {
		return aService.findByTitleLike(title);
	}
	
	@PostMapping("/QueryCategoryAjax")
	@ResponseBody
	public List<ArticleBean> QueryCategoryAjax(int categoryId) {
		return aService.findByCategoryLike(categoryId);
	}

	
	@PostMapping("/forumAdd")
	public String forumAddPage() {
		return "forumAdd";
	}
	

	@PostMapping("/articleAdd")
	public ArticleBean articleAdd(int category,String articleTitle,String articleContent) {
		ArticleBean article = new ArticleBean();
		article.setPlateformCategoryId(category);
		article.setTitle(articleTitle);
		article.setDate(TimeTest.getTime());
		int userId = (int) session.getAttribute("userId");
		Session s = factory.openSession();
		ArticleUserBean userID = s.get(ArticleUserBean.class,userId);
		article.setUser(userID);
		s.close();
		return aService.insert(article);
	}

	
	@PostMapping("/forumUpdatePage")
	public String forumUpdatePage(int articleId) {
		ArticleBean updateDetail =aService.findById(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forumUpdate";
	}
	
	@PostMapping("/articleUpdate")
	public ArticleBean articleUpdate(int articleId,String aTitle,String aContent) {
		ArticleBean article = new ArticleBean();
		article.setArticleId(articleId);
		article.setTitle(aTitle);
		article.setArticleContent(aContent);

		return aService.insert(article);
	}

	@PostMapping("/articleDetail")
	public String articleDetail(int articleId) {
		ArticleBean selectDetail =aService.findById(articleId);
		List<ArticleReplyBean> selectReplyAll =arService.findAllByUserId(articleId);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forumDetail";
	}
	
	@PostMapping("/articleDelete")
	public String articleDelete(int number) {
		aService.deleteById(number);
		return "redirect:/QueryAllPage";
	}
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	@PostMapping("/replyAdd")
	public String replyAdd(int articleId,String replyContent) {
    	Long time= TimeTest.getTime();
    	int userId = (int) session.getAttribute("userId");
    	Session s = factory.openSession();
    	ArticleUserBean userID = s.get(ArticleUserBean.class,userId);
    	ArticleBean articleID = s.get(ArticleBean.class,articleId);
    	s.close();
    	ArticleReplyBean articleReplyBean = new ArticleReplyBean(articleID, userID,replyContent, time);
    	reply.insert(articleReplyBean);
		return "forward:/articleDetail";
	}

	@PostMapping("/replyDelete")
	public String replyDelete(int replyId,int articleId) {
		reply.deleteOne(replyId);
		ArticleBean selectDetail = article.select(articleId);
		List<ArticleReplyBean> selectReplyAll = reply.selectAll(articleId);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		return "forumDetail";
	}
	
	
	
	@PostMapping("/replyUpdatePage")
	public String replyUpdatePage(int replyId) {
		ArticleReplyBean replyUpdateDetail = reply.select(replyId);
		session.setAttribute("replyUpdateDetail", replyUpdateDetail);
		return "forumReplyUpdate";
	}
	
	@PostMapping("/replyUpdate")
	public String replyUpdate(int articleId,int replyId ,String replyContent,Model model) {
		reply.updateOne(replyId, replyContent);
		
		ArticleBean selectDetail = article.select(articleId);
		List<ArticleReplyBean> selectReplyAll = reply.selectAll(articleId);
		session.setAttribute("selectDetail", selectDetail);
		session.setAttribute("selectReplyAll", selectReplyAll);
		
		return "forumDetail";
	}
	
	
	
	@GetMapping("/forumUser")
	public String forumUser() {
		return "forumUserPage";
	}

	
	@GetMapping("/QueryUserArticle")
	@ResponseBody
	public List<ArticleBean> QueryUserArticle() {
		int userId = (int) session.getAttribute("userId");
		 List<ArticleBean> artilces = new ArrayList<>();
		 Iterable<ArticleBean> selectUserId = aurs.selectArticle(userId);
		for (ArticleBean article : selectUserId) {
			artilces.add(article);
		}
		return artilces;
		
	}
	
	@GetMapping("/QueryUserReply")
	@ResponseBody
	public List<ArticleReplyBean> QueryUserReply() {
		int userId = (int) session.getAttribute("userId");
		List<ArticleReplyBean> artilceReplys = new ArrayList<>();
		List<ArticleReplyBean> UserReply = aurs.selectReply(userId);
		for (ArticleReplyBean article : UserReply) {
			artilceReplys.add(article);
		}
		return artilceReplys;
	}
	
	
	@PostMapping("/UserUpdateArticlePage")
	public String UserUpdateArticlePage(int articleId) {
		ArticleBean updateDetail = article.select(articleId);
		session.setAttribute("updateDetail", updateDetail);
		return "forumUserArticleUpdate";
	}
	

	@PostMapping("/UserUpdateArticle")
	public String UserUpdateArticle(int articleId,String aTitle,String aContent) {
		article.updateOne(articleId, aTitle, aContent);
		return "redirect:/forumUser";
	}
	
	
	
	@PostMapping("/UserDeleteArticle")
	public String UserDeleteArticle(int number) {
		article.deleteOne(number);
		return "redirect:/forumUser";
	}
	
	
	
	
	
	
	@PostMapping("/UserDeleteReply")
	public String UserDeleteReply(int replyId) {
		System.out.println(replyId);
		reply.deleteOne(replyId);
		return "redirect:/forumUser";
	}
	
	
	
	@PostMapping("/UserUpdateReplyPage")
	public String UserUpdateReplyPage(int replyId) {
		ArticleReplyBean replyUserUpdateDetail = reply.select(replyId);
		session.setAttribute("replyUserUpdateDetail", replyUserUpdateDetail);
		return "forumUserReplyUpdate";
	}
	
	@PostMapping("/UserUpdateReply")
	public String UserUpdateReply(int replyId ,String replyContent) {
		reply.updateOne(replyId, replyContent);
				
		return "redirect:/forumUser";
	}
	
	@RequestMapping(value="/images",produces={"application/json; charset=UTF-8"})
	@ResponseBody //application/json
	 public Object  test1(@RequestParam("img") MultipartFile file, Map<String, Object> map,HttpServletRequest request) throws IOException {
        System.out.println("file.getOriginalFilename() "+file.getOriginalFilename());
        //使用uuid解决文件重名
        String outpath = "C:\\Users\\smile\\Desktop\\forum\\Epicer\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+UUID.randomUUID().toString().replaceAll("-","");
        byte[] bytes = file.getBytes();
        //读取文件路径
        String path = request.getServletContext().getRealPath("/images/");
        //如果不存在则新建
        File imgFile = new File(path);
        if (!imgFile.exists()) {
            imgFile.mkdirs();
        }
        String fileName = file.getOriginalFilename();// 文件名称
        System.out.println(path + fileName);
        //对文件进行写入
        try (FileOutputStream fos = new FileOutputStream(new File(path + fileName))) {
            int len = 0;
            fos.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
 //這方法照片要重新刷新才能顯示    //  String value = "images/" +outpath.substring(outpath.lastIndexOf("\\")+1)+ fileName;
        String value = "images/"+ fileName;
        //保存到服务器目录，记录名称地址
        fileUtils.upload(file, outpath, file.getOriginalFilename());
        map.put("imgName",fileName);
        map.put("imgUrl",outpath+fileName);
        System.out.println(map);
        //返回信息上传
        return  new WangEditorResponse("1", Arrays.asList(value));

    }
}
	
	

