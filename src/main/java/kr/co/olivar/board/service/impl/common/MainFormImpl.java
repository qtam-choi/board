package kr.co.olivar.board.service.impl.common;

import com.sun.management.OperatingSystemMXBean;
import kr.co.olivar.board.service.AbstractHpService;
import org.springframework.stereotype.Component;

import java.lang.management.ManagementFactory;
import java.util.HashMap;
import java.util.Map;

@Component
public class MainFormImpl extends AbstractHpService
{

	@Override
	public Object serviceCallImpl(Map dataMap)
	{
		
		Map returnMap = new HashMap();

		OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);
		
		returnMap.put("cpu_usage", osBean.getSystemCpuLoad() * 100);
		returnMap.put("mem_free", osBean.getFreePhysicalMemorySize()/1024/1024/1024);
		returnMap.put("mem_tot", osBean.getTotalPhysicalMemorySize() /1024/1024/1024);

		
		return returnMap;
		
	}
}
