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
	
	@RequestMapping("/bookingMainView")
	public String bookingMainView() {
		return "booking/main";
	}
	
	@RequestMapping("/reservationListView")
	public String reservationListView(Model model) {
		List<Booking> reservationList = bookingBO.getBookingList();
		model.addAttribute("reservationList", reservationList);
		return "booking/getReservationList";
	}
	
}
