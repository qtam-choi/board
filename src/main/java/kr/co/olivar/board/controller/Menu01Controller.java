package kr.co.olivar.board.controller;

import kr.co.olivar.board.service.impl.menu01.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;



@Controller
public class Menu01Controller {
	
	
	@Autowired
	Menu0101Impl menu0101Impl;
	
	@Autowired
	Menu0101DetailImpl menu0101DetailImpl;
	
	@Autowired
	Menu0102Impl menu0102Impl;
	
	@Autowired
	Menu0103Impl menu0103Impl;
	
	@Autowired
	Menu0104Impl menu0104Impl;
	
	@Autowired
	Menu0105Impl menu0105Impl;


	/**********************************************
	 * 서비스 조회
	 **********************************************/
	// 발송현황
	@RequestMapping("/menu01/menu0101.do")  
	public ModelAndView menu0101(HttpServletRequest request,
			ModelMap model, HttpServletResponse response) throws IOException {
		

		ModelAndView modelAndView = new ModelAndView("");
		
		Map paramMap = new HashMap();
		
		Enumeration req = request.getParameterNames();

		 while(req.hasMoreElements()){
			 String key = req.nextElement().toString();
			 String value = request.getParameter(key);
			 
			 paramMap.put(key, value);
		 }
		 
		 modelAndView.setViewName("menu01/menu0101");
		
		Map resultMap = (Map)menu0101Impl.serviceCall(paramMap);
		
		Set<String> keys = resultMap.keySet();
		
		for(String key : keys){
			modelAndView.addObject(key, resultMap.get(key));
		}
		
		return modelAndView;
	}
	
	
	
		
		//발송현황 Detail
		@RequestMapping("/menu01/menu0101Detail.do")
		public ModelAndView menu0101Detail(HttpServletRequest request,
				ModelMap model, HttpServletResponse response) throws IOException {
			
			ModelAndView modelAndView = new ModelAndView("jsonView");
			
			modelAndView.setViewName("menu01/menu0101Detail");
			
			Map paramMap = new HashMap();
			
			Enumeration req = request.getParameterNames();

			 while(req.hasMoreElements()){
				 String key = req.nextElement().toString();
				 String value = request.getParameter(key);
				 
				 paramMap.put(key, value);
			 }
			
			Map serviceMap = (Map)menu0101DetailImpl.serviceCall(paramMap);
			
			Set<String> keys = serviceMap.keySet();
			
			for(String key : keys){
				modelAndView.addObject(key, serviceMap.get(key));
			}
			
			return modelAndView;
		}
		
		
		/**********************************************
		 * 발송결과
		 **********************************************/
		//  리스트
		@RequestMapping("/menu01/menu0102.do")  
		public ModelAndView menu0102(HttpServletRequest request,
				ModelMap model, HttpServletResponse response) throws IOException {
			

			ModelAndView modelAndView = new ModelAndView("");
			
			Map paramMap = new HashMap();
			
			Enumeration req = request.getParameterNames();

			 while(req.hasMoreElements()){
				 String key = req.nextElement().toString();
				 String value = request.getParameter(key);
				 
				 paramMap.put(key, value);
			 }
			 
			
			modelAndView.setViewName("menu01/menu0102");
			
			Map resultMap = (Map)menu0102Impl.serviceCall(paramMap);
			
			Set<String> keys = resultMap.keySet();
			
			for(String key : keys){
				modelAndView.addObject(key, resultMap.get(key));
			}
			
			return modelAndView;
		}
		
		
		/**********************************************
		 * 유통증명등록
		 **********************************************/
		//  리스트
		@RequestMapping("/menu01/menu0103.do")  
		public ModelAndView menu0103(HttpServletRequest request,
				ModelMap model, HttpServletResponse response) throws IOException {
			

			ModelAndView modelAndView = new ModelAndView("");
			
			Map paramMap = new HashMap();
			
			Enumeration req = request.getParameterNames();

			 while(req.hasMoreElements()){
				 String key = req.nextElement().toString();
				 String value = request.getParameter(key);
				 
				 paramMap.put(key, value);
			 }
			 
			
			modelAndView.setViewName("menu01/menu0103");
			
			Map resultMap = (Map)menu0103Impl.serviceCall(paramMap);
			
			Set<String> keys = resultMap.keySet();
			
			for(String key : keys){
				modelAndView.addObject(key, resultMap.get(key));
			}
			
			return modelAndView;
		}
		
		
		
		
		/**********************************************
		 * 개통신청서
		 **********************************************/
		//  리스트
		@RequestMapping("/menu01/menu0104.do")  
		public ModelAndView menu0104(HttpServletRequest request,
				ModelMap model, HttpServletResponse response) throws IOException {
			

			ModelAndView modelAndView = new ModelAndView("");
			
			Map paramMap = new HashMap();
			
			Enumeration req = request.getParameterNames();

			 while(req.hasMoreElements()){
				 String key = req.nextElement().toString();
				 String value = request.getParameter(key);
				 
				 paramMap.put(key, value);
			 }
			 
			
			modelAndView.setViewName("menu01/menu0104");
			
			Map resultMap = (Map)menu0104Impl.serviceCall(paramMap);
			
			Set<String> keys = resultMap.keySet();
			
			for(String key : keys){
				modelAndView.addObject(key, resultMap.get(key));
			}
			
			return modelAndView;
		}
		
		
		/**********************************************
		 * 사업자 공인전자 주소등록
		 **********************************************/
		//  리스트
		@RequestMapping("/menu01/menu0105.do")  
		public ModelAndView menu0105(HttpServletRequest request,
				ModelMap model, HttpServletResponse response) throws IOException {
			

			ModelAndView modelAndView = new ModelAndView("");
			
			Map paramMap = new HashMap();
			
			Enumeration req = request.getParameterNames();

			 while(req.hasMoreElements()){
				 String key = req.nextElement().toString();
				 String value = request.getParameter(key);
				 
				 paramMap.put(key, value);
			 }
			 
			
			modelAndView.setViewName("menu01/menu0105");
			
			Map resultMap = (Map)menu0105Impl.serviceCall(paramMap);
			
			Set<String> keys = resultMap.keySet();
			
			for(String key : keys){
				modelAndView.addObject(key, resultMap.get(key));
			}
			
			return modelAndView;
		}
		

		
	
	
}
