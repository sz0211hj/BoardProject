package egovframework.example.sample.service;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	//페이징
	Integer page = 1;
	Integer start = 0;
	Integer end = 10;
	

	private int b_no;
	private String b_title;
	private String b_writer;
	private String b_content;
	private Timestamp b_date;
	private String b_state;
	private String delt_yn;
	private String orderCond;

	private String[] valueArr;
}
