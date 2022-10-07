package com.epicer.service.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.course.courseFeedBackRepository;
import com.epicer.model.course.coursefeedback;

@Service
@Transactional
public class CourseFeedBackService {
	
	@Autowired
	private courseFeedBackRepository cfrepo;
	
	
	////insert/////
	public coursefeedback insertFeedBack(coursefeedback cfb) {					
			return cfrepo.save(cfb);
		
	}
	
	///querybycourseid///
	
	

}
