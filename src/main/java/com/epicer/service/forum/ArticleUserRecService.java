package com.epicer.service.forum;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ArticleUserRecService{

	@Autowired
	private ArticleUserRecDao aurDao;



	public List<ArticleBean> selectArticle(int userid) {
		// TODO Auto-generated method stub
		return  aurDao.selectArticleRec(userid);
	}

	public List<ArticleReplyBean> selectReply(int userid) {
		// TODO Auto-generated method stub
		return  aurDao.selectReplyRec(userid);
	}




	

	

}
