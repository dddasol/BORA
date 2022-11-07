package com.bora.controller.report;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bora.domain.report.ConsumeAllListVO;
import com.bora.domain.report.ConsumeLastMonListVO;
import com.bora.domain.report.ConsumeThisMonListVO;
import com.bora.service.report.ConsumeAllListService;

@Controller
@RequestMapping("/consume/*")
public class ConsumeController {
	
	@Inject
	ConsumeAllListService cService;

	private static final Logger log = LoggerFactory.getLogger(BookController.class);
		
	// 소비 리스트 메서드
	@RequestMapping(value = "/consumeAllList", method = RequestMethod.GET)
	public String getConsumeAllList(Model model, ConsumeLastMonListVO consumeLastMonList,
			ConsumeThisMonListVO consumeThisMonList, ConsumeAllListVO consumeAllList, 
			HttpServletRequest request) throws Exception {
		// 1. 저번 달 소비 리스트
		// 전달된 정보 저장
		log.info("consumeLastMonList 호출됨");

		// 컨트롤러 -> 서비스 호출 (동작 메서드,,)
		log.info("consumeLastMonList -----> Service 호출됨");
					
		List<ConsumeLastMonListVO> consumeLastMon = cService.getConsumeLastMonList("admin");

		model.addAttribute("consumeLastMon", consumeLastMon);
		
		// 2. 이번 달 소비 리스트
		// 전달된 정보 저장
		log.info("consumeThisMonList 호출됨");

		// 컨트롤러 -> 서비스 호출 (동작 메서드,,)
		log.info("consumeThisMonList -----> Service 호출됨");

		List<ConsumeThisMonListVO> consumeThisMon = cService.getConsumeThisMonList("admin");

		model.addAttribute("consumeThisMon", consumeThisMon);
		
		// 3. 이번 소비 비교 리스트
		// 전달된 정보 저장
		log.info("consumeAllList 호출됨");

		// 컨트롤러 -> 서비스 호출 (동작 메서드,,)
		log.info("consumeAllList -----> Service 호출됨");
	        
		// 서비스 - 
		List<ConsumeAllListVO> consumeList = cService.getConsumeAllList("admin");
        
		int bk_lastmon_total = Integer.parseInt(request.getParameter("bk_lastmon_total"));
		int bk_thismon_total = Integer.parseInt(request.getParameter("bk_thismon_total"));
		int bk_total_consume = (bk_thismon_total - bk_lastmon_total);
		int bk_consume_compare = (bk_thismon_total - bk_lastmon_total) * 100 / bk_lastmon_total;
		
		consumeLastMonList.setBk_lastmon_total(bk_lastmon_total);
		consumeThisMonList.setBk_thismon_total(bk_thismon_total);
		consumeAllList.setBk_total_consume(bk_total_consume);
		consumeAllList.setBk_consume_compare(bk_consume_compare);
		 
		
		model.addAttribute("consumeList", consumeList);
        
		return "book/consumeAllList";
	}

	
}