package com.quiz.lesson01;

// 일반 자바 bean으로 만드는 편, 데이터 저장소의 역할
public class Board {

	private String title;
	private String user;
	private String content;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
