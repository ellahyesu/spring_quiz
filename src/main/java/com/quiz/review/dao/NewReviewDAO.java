package com.quiz.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.review.model.NewReview;

@Repository
public interface NewReviewDAO {

	public List<NewReview> selectReviewByStoreId(@Param("storeId") int storeId);
	
	public List<NewReview> selectReviewByIdAndStoreName(
			@Param("storeId") int storeId
			, @Param("storeName") String storeName);

}
