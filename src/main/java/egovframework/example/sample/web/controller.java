/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.Paging;
import egovframework.example.sample.service.BoardBackupVO;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.impl.BoardMapper;



@Controller
public class controller {
	
	@Autowired
	BoardMapper bm;
	
	//전체조회
	@RequestMapping("/listBoard.do")
	public String listBoard(BoardVO vo, Model model,Paging paging){
		paging.setPageUnit(10); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(3); // 표시 되는 페이지 번호
		//페이징
		if(vo.getPage() == null ){
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(bm.getCount(vo));
		model.addAttribute("paging", paging); //페이징
		
		//게시글List
		List<BoardVO> list = bm.listBoard(vo);
		model.addAttribute("list", list);
		
		//총 게시글 수 - 삭제된 글 제외
		int count = bm.getCount(vo);
		model.addAttribute("count", count);
		return "listBoard";
	}

	//단건조회
	@RequestMapping("/selectBoard.do")
	public String selectBoard(BoardVO vo, Model model){
		model.addAttribute("select", bm.selectBoard(vo));
		return "selectBoard";
	}
	
	//등록
	@RequestMapping("/insertBoardForm.do")
	public String insertBoardForm(Model model){
		return "insertBoard";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(@ModelAttribute  BoardVO vo) throws IOException{

		String title = vo.getB_title();
		String writer = vo.getB_writer();
		String content = vo.getB_content();
		String val = "";
		System.out.println("=================================" + content);
		System.out.println("=================================" + content.length());
			if(title.length() > 50){
				val = "b_title.error";
			}else if(writer.length() > 50){
				val = "b_writer.error";
			}else if(content.length() > 250){
				val = "b_content.error";
			}else{
				bm.insertBoard(vo);	
				val = "board.inst.success";
			}	
		return val;
	}
	
	//수정
	@RequestMapping("/updateBoardForm.do")
	public String updateBoardForm(Model model,BoardVO vo){
		model.addAttribute("list", bm.selectBoard(vo));
		return "updateBoard";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo){
		bm.updateBoard(vo);
		return "redirect:/selectBoard.do?b_no="+vo.getB_no();
	}
	
	
	//삭제
	@ResponseBody
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, String[] valueArr){
		vo.setValueArr(valueArr);
		bm.deleteBoard(vo);	
		return "redirect:/listBoard.do";
	}

	
	//로그 조회
	@RequestMapping("/logList.do")
	public String logList(BoardBackupVO vo, Model model,Paging paging){
		paging.setPageUnit(5); //한 페이지에 표시되는 레코드 건수
		paging.setPageSize(3); // 표시 되는 페이지 번호
		//페이징
		if(vo.getPage() == null ){
			vo.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		paging.setTotalRecord(bm.getCountLog(vo));
		model.addAttribute("paging", paging);  //페이징
		
		List<BoardBackupVO> logList = bm.logList(vo);
		model.addAttribute("logList", logList);
		return "logList";
	}
}
