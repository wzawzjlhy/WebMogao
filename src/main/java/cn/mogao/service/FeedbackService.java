package cn.mogao.service;

import cn.mogao.dict.FeedBackDict;
import cn.mogao.pojo.Feedback;
import cn.mogao.utils.PageUtil;

/**
 *
 * @author yq
 * @Date  2019/03/15
 *
 */


public interface FeedbackService {

	void insert(Feedback feedback);

	PageUtil<FeedBackDict> listbyPage(Integer page, Integer size);

}
