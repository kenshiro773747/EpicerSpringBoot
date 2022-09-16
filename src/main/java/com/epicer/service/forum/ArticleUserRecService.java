package com.epicer.service.forum;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.forum.ArticleBean;
import com.epicer.model.forum.ArticleReplyBean;


@Service
@Transactional
public class ArticleUserRecService{

	@Autowired
	private ArticleUserRecRepository aurRepo;



	public List<ArticleBean> selectArticle(int userid) {
		// TODO Auto-generated method stub
		return  aurRepo.findArticleByUserIdLike(userid);
	}

	public List<ArticleReplyBean> selectReply(int userid) {
		// TODO Auto-generated method stub
		return  aurRepo.findReplyByUserIdLike(userid);
	}




	

	

}
