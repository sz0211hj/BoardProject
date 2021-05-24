package egovframework.example.sample.service;

import lombok.Data;

@Data
public class BoardBackupVO {
	//페이징
	Integer page = 1;
	Integer start = 0;
	Integer end = 5;
	
	private int logNum;
	private int b_no;
	private String b_title;
	private String b_writer;
	private String b_content;
	private String b_date;
	private String b_state;
	private String delt_yn;
}
