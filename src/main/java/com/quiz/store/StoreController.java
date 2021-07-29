package com.quiz.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/store/store_info")
	public String storeReviewView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "store/getStoreInfo";
	}
	
	
}
