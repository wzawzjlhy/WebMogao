package cn.mogao.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author yq
 * @Date  2019/04/17
 *
 */
public class TimeUtil {
	public static String getNowTime(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}

}
