package cn.mogao.dict;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author yq
 * @Date  2019/04/18
 *
 */
public class LoginStatuDict {
	public static Map<Integer, String> map = new HashMap<>();
	static {
		/**
		 * #  是否允许登录，0  允许登录  1 禁止登录  默认为0
		 */
		map.put(0, "允许登录");
		map.put(1, "禁止登录");
	}

}
