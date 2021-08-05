package com.quiz.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.booking.bo.BookingBO;

@RequestMapping("/booking")
@RestController
public class BookingRestController {

	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/delete_booking_by_id")
	public String isDeleteBookingById(@RequestParam int id) {
		int row = bookingBO.deleteBookingById(id);
		
		return row == 1 ? "success" : "fail";
	}
}
