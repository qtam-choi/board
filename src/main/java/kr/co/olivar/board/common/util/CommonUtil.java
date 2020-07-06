package kr.co.olivar.board.common.util;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



/**  
 * @ClassName : StringUtility.java
 * @Description : 문자열 처리 Utility Class
 * @Author  모바일개발팀
 * @Since 2013. 3. 12.
 * @Version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일             수정자                수정내용
 *  --------------        ---------------       ---------------------------
 *   2013. 3. 12.        모바일개발팀            최초작성
 *
 * </pre>
 *  
 * Copyright (C) by SMC All right reserved.
 */
public class CommonUtil {
	
	
    private static SqlSessionTemplate sqlSession;
	
	@Autowired
    protected static SqlSessionTemplate sql;
	
	
	/**************************************
	 * 단방향
	 ****************************************/
	
	public static String sha256(String str){
        String SHA = "";
        try{
            MessageDigest sh = MessageDigest.getInstance("SHA-256");
            sh.update(str.getBytes());
            byte byteData[] = sh.digest();
  
            StringBuffer sb = new StringBuffer();
            for(int i = 0 ; i < byteData.length ; i++){
                sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
            }
            SHA = sb.toString();
        }catch(NoSuchAlgorithmException e){
            e.printStackTrace();
            SHA = null;
        }
        return SHA;
    }
	
	
	/**************************************
	 * 태그 제거
	 ****************************************/
	public static String removeTag(String html) throws Exception {
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	
	
	
	
	
}
