package com.quiz.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingViewController {
	
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/booking_main_view")
	public String bookingMainView() {
		return "booking/main";
	}
	
	@RequestMapping("/booking_list_view")
	public String reservationListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "booking/getBookingList";
	}
	
	@RequestMapping("/add_booking_view")
	public String addFavoriteView() {
		return "booking/addBooking";
	}
	
}
