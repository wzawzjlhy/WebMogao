package cn.mogao.dict;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author yq
 * @Date  2019/03/12
 *
 */

public class FeedbackStatuDict {
	public static Map<Integer, String> map = new HashMap<>();
	static {
		//反馈是否处理 0未处理  1已经处理
		map.put(0, "未处理");
		map.put(1, "已经处理");
	}
}
