package cn.mogao.service.impl;

import cn.mogao.annotation.Log;
import cn.mogao.mapper.AdminMapper;
import cn.mogao.pojo.Admin;
import cn.mogao.pojo.AdminExample;
import cn.mogao.pojo.AdminExample.Criteria;
import cn.mogao.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author yq
 * @Date  2019/04/14
 *
 */

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
    @Log(module = "管理員模塊",description = "登錄操作")

	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		AdminExample adminExample=new AdminExample();
		Criteria createCriteria = adminExample.createCriteria();
		createCriteria.andUsernameEqualTo(admin.getUsername());
		createCriteria.andPasswordEqualTo(admin.getPassword());
		List<Admin> selectByExample = this.adminMapper.selectByExample(adminExample);
		if(selectByExample!=null&&selectByExample.size()>0){
			return selectByExample.get(0);
		}
		return null;
	}
	

}
