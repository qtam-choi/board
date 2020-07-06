package kr.co.olivar.board.service.impl.menu01;

import kr.co.olivar.board.service.AbstractHpService;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;


@Component
public class Menu0101DetailImpl extends AbstractHpService
{
	@Override
	public Object serviceCallImpl(Map dataMap)
	{
		Map returnMap = new HashMap();
		
		//detail
		Map dataView = sqlSession.selectOne("ADMIN_MENU01.get0101Data", dataMap);	
		returnMap.put("dataView", dataView);
		
		return returnMap;
		

	}
}
