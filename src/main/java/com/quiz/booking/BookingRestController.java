package com.quiz.booking;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.model.Booking;

@RequestMapping("/booking")
@RestController
public class BookingRestController {

	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/main")
	public Map<String, Object> getBookingListByNameAndPhoneNumber(
			@RequestParam String name
			, @RequestParam String phoneNumber) {
		Booking booking = bookingBO.getBookingListByNameAndPhoneNumber(name, phoneNumber);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", "success");
		resultMap.put("booking", booking);
		return resultMap;
	}
	
	// 방법(1)
	@DeleteMapping("/delete_booking_by_id")
	public String isDeleteBookingById(@RequestParam int id) {
		int row = bookingBO.deleteBookingById(id);
		
		return row == 1 ? "success" : "fail";
	}
	
	// 방법(2) - 풀이
	// @DeleteMapping("/delete_booking_by_id")
	// public Map<String, String> isDeleteBookingById(@RequestParam int id) {
			// int row = bookingBO.deleteBookingById(id);   		
			// Map<String, String> result = new HashMap<>();
			// if (row > 0)
				// result.put("result", "success")
			// else
	   			// result.put("result", "fail")
		// return result;
	//}
	
	@PostMapping("/add_booking")
	public String addbooking(
			@RequestParam String name
			, @RequestParam String date
			, @RequestParam int day
			, @RequestParam int headcount
			, @RequestParam String phoneNumber) {
		// DB Insert
		int row = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		return row == 1 ? "success" : "fail";
	}
}
