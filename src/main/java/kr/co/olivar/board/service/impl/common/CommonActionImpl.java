package kr.co.olivar.board.service.impl.common;


import com.sun.management.OperatingSystemMXBean;
import kr.co.olivar.board.service.AbstractHpService;
import kr.co.olivar.board.service.SifResult;
import org.springframework.stereotype.Component;

import java.lang.management.ManagementFactory;
import java.util.Map;

@Component
public class CommonActionImpl extends AbstractHpService
{	
	@Override
	public Object serviceCallImpl(Map dataMap)
	{	
		SifResult result = new SifResult();
		String action = (String)dataMap.get("action");
		
		 if(action.equals("PWCHG")){  
			
			sqlSession.update("ADMIN_COMMON.upUserInfoPw", dataMap);
		
		}else if(action.equals("MAIN")){  
			
			
			OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);
			
			result.setResultObject("cpu_usage", osBean.getSystemCpuLoad() * 100);
			result.setResultObject("mem_free", osBean.getFreePhysicalMemorySize()/1024/1024/1024);
			result.setResultObject("mem_tot", osBean.getTotalPhysicalMemorySize() /1024/1024/1024);
	        
          
		}
		
		return result.getResultMap();
	}
	
}
