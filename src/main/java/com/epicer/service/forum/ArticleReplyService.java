package com.epicer.service.forum;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.epicer.model.forum.ArticleReplyBean;




@Service
@Transactional
public class ArticleReplyService{
	
	@Autowired
	private ArticleReplyRepository arRepo;
	
	public ArticleReplyBean findById(int replyId) {
		Optional<ArticleReplyBean> op = arRepo.findById(replyId);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public List<ArticleReplyBean> findAllByUserId(int UserId){
		return arRepo.findAllByUser(UserId);
	}
	
	public List<ArticleReplyBean> findAllByArticleId(int id){
		return arRepo.findAllByArticleId(id);
	}


	public ArticleReplyBean insert(ArticleReplyBean articleReplyBean) {
		return arRepo.save(articleReplyBean);
	}


	public void deleteById(int id) {
		arRepo.deleteById(id);
	}

	

}
