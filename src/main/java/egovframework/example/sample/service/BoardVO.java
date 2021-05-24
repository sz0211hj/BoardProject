package egovframework.example.sample.service;

import lombok.Data;

@Data
public class BoardVO {
	//페이징
	Integer page = 1;
	Integer start = 0;
	Integer end = 5;
	

	private int b_no;
	private String b_title;
	private String b_writer;
	private String b_content;
	private String b_date;

	private int logNum;
	private int b_noTemp;
	private String b_titleTemp;
	private String b_writerTemp;
	private String b_contentTemp;
	private String dateTemp;
	private String b_state;
}
