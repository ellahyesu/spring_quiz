package com.quiz.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.review.bo.NewReviewBO;
import com.quiz.review.model.NewReview;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private NewReviewBO newReviewBO;
	
	@RequestMapping("/store_info")
	public String storeInfoView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "store/getStoreInfo";
	}
	
	@RequestMapping("/store_review")
	public String getStoreReview(
			@RequestParam("storeId") int storeId
			, @RequestParam("storeName") String storeName
			, Model model
	) {
		List<NewReview> newReviewList = newReviewBO.getReviewByIdAndStoreName(storeId, storeName);
		model.addAttribute("newReviewList", newReviewList);
		model.addAttribute("storeName", storeName);
		return "store/getStoreReview";
	}
	
}
