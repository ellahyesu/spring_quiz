package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz02 {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 요청 url - http://localhost/lesson03/quiz01/2?rent_price=90
	//@RequestMapping("/lesson03/quiz01/2")
	//public List<RealEstate> quiz02(
	//		@RequestParam(value="rentPrice") int rentPrice
	//) {
	//	return realEstateBO.getRealEstate(rentPrice);
	//}
}
