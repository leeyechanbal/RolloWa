package com.br.project.controller.attendance;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.br.project.dto.attendance.AttendanceDto;
import com.br.project.dto.common.GroupDto;
import com.br.project.dto.common.PageInfoDto;
import com.br.project.dto.member.MemberDto;
import com.br.project.service.attendance.AttendanceService;
import com.br.project.service.organizaion.OrganizationService;
import com.br.project.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 2. 출석 관련 컨트롤러

@RequestMapping("/attendance")
@Controller
@RequiredArgsConstructor
@Slf4j
public class AttendanceController {

	private final AttendanceService attendanceService;
	private final PagingUtil pagingUtil;
	
	// 2.1 출결 상태 조회
	@GetMapping("/list.do")
	public ModelAndView list(@RequestParam(value="page", defaultValue="1") int currentPage
					, ModelAndView mv) {
		
		int listCount = attendanceService.selectAttendanceListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 10, 10);
		List<HashMap<String, String>> list = attendanceService.selectAttendanceList(pi);

		List<AttendanceDto> attendanceCount = attendanceService.SelectAttendanceCount();
		
		//log.debug("pageInfo : {}", pi);
		log.debug("list : {}", list);
		
		log.debug("attendanceCount : {}", attendanceCount);
		
		mv.addObject("pi", pi)
		  .addObject("listCount", listCount)
		  .addObject("list", list)
		  .addObject("attendanceCount", attendanceCount)
		  .setViewName("attendance/list");
		
		return mv;
	}
	
	
}
