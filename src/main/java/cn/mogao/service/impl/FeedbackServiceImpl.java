package cn.mogao.service.impl;

import cn.mogao.annotation.Log;
import cn.mogao.dict.FeedBackDict;
import cn.mogao.mapper.FeedbackMapper;
import cn.mogao.pojo.Feedback;
import cn.mogao.pojo.FeedbackExample;
import cn.mogao.service.FeedbackService;
import cn.mogao.utils.PageUtil;
import cn.mogao.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yq
 * @Date  2019/03/15
 *
 */


@Service
@Transactional
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	private FeedbackMapper feedbackMapper;
	@Log(module = "系統反饋模塊",description = "添加反饋")

	@Override
	public void insert(Feedback feedback) {
		// TODO Auto-generated method stub
		feedback.setStatus(0);
		String content = feedback.getContent();
		feedback.setContent(TimeUtil.getNowTime()+"###@@@"+content);
		this.feedbackMapper.insert(feedback);
		
	}

	@Override
	public PageUtil<FeedBackDict> listbyPage(Integer page, Integer size) {
		if (page == null) {
			page = 1;
		}
		if (size == null) {
			size = 5;
		}
		PageUtil<FeedBackDict> pageUtil = new PageUtil<FeedBackDict>();
		pageUtil.setPage_current(page);
		pageUtil.setPage_size(size);
		FeedbackExample feedback = new FeedbackExample();
		cn.mogao.pojo.FeedbackExample.Criteria createCriteria = feedback.createCriteria();
		createCriteria.andIdIsNotNull();
		int countByExample = this.feedbackMapper.countByExample(feedback);
		long Garagetotal = this.feedbackMapper.countByExample(feedback);
		pageUtil.setPage_total((Garagetotal % size) == 0 ? (Garagetotal / size) : (Garagetotal / size) + 1);
		List<Feedback> list = this.feedbackMapper.findfeedbacklimit((page - 1) * size,
				size);
		
		
		List<FeedBackDict> listfee=new ArrayList<>();
		
		
		for(int i=0;i<list.size();i++){
			Feedback feedback2 = list.get(i);
			FeedBackDict f=new FeedBackDict();
			f.setType(feedback2.getType()
					)
			;
			f.setTelephone(feedback2.getTelephone());
			String content = feedback2.getContent();
			String[] split = content.split("###@@@");
			f.setTime(split[0]);
			f.setContent(split[1]);
			listfee.add(f);
		}
		pageUtil.setPage_list(listfee);
		return pageUtil;
	}
}
