package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03")
@RestController
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 요청 url - http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam(value="id") int id
	) {
		return realEstateBO.getRealEstateById(id);
	}

	// 요청 url - http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/quiz01/2")
	public List<RealEstate> quiz01_2(
			@RequestParam(value="rent_price") int rentPrice
	) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// 요청 url - http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/quiz01/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price
	) {
		return realEstateBO.getRealEstateListByAreaAndPrice(area, price);
	}
	
	// 요청 URL - http://localhost/lesson03/quiz02/1
	@RequestMapping("/quiz02/1")
	public String quiz02_1() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int row = realEstateBO.insertRealEstate(realEstate);
		
		return "입력 성공 : " + row;
	}
	
	// 요청 URL - http://localhost/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/quiz02/2")
	public String quiz02_2(
			@RequestParam(value="realtor_id") int realtorId
	) {
		int row = realEstateBO.insertRealEstateAsField(
				realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120  
				);
		
		return "입력 성공 : " + row;
	}
	
}

