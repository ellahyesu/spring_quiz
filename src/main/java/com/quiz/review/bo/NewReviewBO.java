package com.quiz.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.review.dao.NewReviewDAO;
import com.quiz.review.model.NewReview;

@Service
public class NewReviewBO {

	@Autowired
	private NewReviewDAO newReviewDAO;
	
	public List<NewReview> getReviewByStoreId(int storeId) {
		return newReviewDAO.selectReviewByStoreId(storeId);
	}
	
	public List<NewReview> getReviewByIdAndStoreName(
				int storeId
				, String storeName
	) {
		return newReviewDAO.selectReviewByIdAndStoreName(storeId, storeName);
		
	}
	
}
