package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz03 {

	@Autowired
	private RealEstateBO realEstateBO;

	// 요청 url - http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<RealEstate> quiz03(
			@RequestParam(value="area") int area
			, @RequestParam(value="price") int price
	) {
		return realEstateBO.getRealEstate(area, price);
	}
}
