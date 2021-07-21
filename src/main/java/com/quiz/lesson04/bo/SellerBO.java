package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public void insertSeller(String nickname, String profileImageUrl, double temparature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temparature);
	}
	
	public Seller getSellerById(Integer id) {
		
		if (id == null) 
			return sellerDAO.selectLastSeller();
		return sellerDAO.selectSellerById(id);
	}
}
