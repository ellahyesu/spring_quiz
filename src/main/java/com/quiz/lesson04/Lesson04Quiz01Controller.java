package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost/lesson04/quiz01/1
	@RequestMapping(path="/1", method=RequestMethod.GET)
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temparature") double temparature
	) {
		sellerBO.insertSeller(nickname, profileImageUrl, temparature);
		return "lesson04/afterAddSeller";
	}
	@GetMapping("/seller_info")
	public String getSellerView(
			Model model,
			@RequestParam(value="id", required=false) Integer id // 비필수 파라미터 defaultValue="1"
	) {
		Seller seller = sellerBO.getSellerById(id);
		model.addAttribute("result", seller);
		model.addAttribute("subject", "판매자 정보");
		
		return "lesson04/getSeller";
	}
}