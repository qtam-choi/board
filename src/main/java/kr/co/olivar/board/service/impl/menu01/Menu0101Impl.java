package kr.co.olivar.board.service.impl.menu01;

import kr.co.olivar.board.common.util.DateUtil;
import kr.co.olivar.board.common.util.Paging;
import kr.co.olivar.board.service.AbstractHpService;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
public class Menu0101Impl extends AbstractHpService
{
	@Override
	public Object serviceCallImpl(Map dataMap)
	{
		Map returnMap = new HashMap();
		
		int totalCnt = 0;
		int curPage = 1;
		int rowCnt  = 10;
		
		String startDate = DateUtil.getToday();
		String endDate = DateUtil.getToday();
		String init = "Y";
		
		
		if(dataMap.containsKey("curPage")){
			curPage = Integer.parseInt(dataMap.get("curPage").toString());
			init = "N";
		}
		
		if(dataMap.containsKey("rowCnt")){
			rowCnt = Integer.parseInt(dataMap.get("rowCnt").toString());
		}
		
		if(dataMap.containsKey("startDate")){
			startDate = (String)dataMap.get("startDate");
		}else{
			dataMap.put("startDate", startDate);
		}
		
		if(dataMap.containsKey("endDate")){
			endDate = (String)dataMap.get("endDate");
		}else{
			dataMap.put("endDate", endDate);
		}
		
		
		if(!dataMap.containsKey("gubun")) {
			dataMap.put("gubun", "open_api");
		}
	
		
		returnMap.put("startDate", startDate);
		returnMap.put("endDate", endDate);
		
		
		// Paging 관련 
		
		if(init.equals("N")) {
			totalCnt = sqlSession.selectOne("ADMIN_MENU01.sel0101DataListCnt", dataMap);
		}
		Paging paging = new Paging(totalCnt, curPage, rowCnt, 5);
		
		dataMap.put("startNum", paging.getStartNum()); 
		dataMap.put("endNum", paging.getEndNum());
		dataMap.put("pageSize", paging.getNumPerPage());
		
		
		// 관리
		List dataList = null;
		if(init.equals("N")) {
			dataList = sqlSession.selectList("ADMIN_MENU01.sel0101DataList", dataMap);
		}

		returnMap.put("init", init);
		returnMap.put("dataList", dataList);
		returnMap.put("paging", paging);		
		
		
		//기관명
		List orgList =  sqlSession.selectList("ADMIN_COMMON.selOrgList", dataMap);
		returnMap.put("orgList", orgList);		
		
		
		return returnMap;
	}
}
