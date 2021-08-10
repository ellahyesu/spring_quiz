package com.quiz.booking.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.dao.BookingDAO;
import com.quiz.booking.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public Booking getBookingListByNameAndPhoneNumber(
			String name
			, String phoneNumber) {
		return bookingDAO.selectBookingListByNameAndPhoneNumber(name, phoneNumber);
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name
			, String date
			, int day
			, int headcount
			, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, "대기중");
	}
	
}
