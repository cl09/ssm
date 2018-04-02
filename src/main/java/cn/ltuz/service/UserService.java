package cn.ltuz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ltuz.bean.User;
import cn.ltuz.bean.UserExample;
import cn.ltuz.bean.UserExample.Criteria;
import cn.ltuz.dao.UserMapper;



@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	
	/**
	 * 登录功能
	 * @param login_name
	 * @param password
	 * @return
	 */
	public boolean login(String login_name, String password) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andLoginNameEqualTo(login_name);
		criteria.andPasswordEqualTo(password);
		long count = userMapper.countByExample(example);
		return count > 0;
	}

	
	/**
	 * 注册功能
	 * @param user
	 */
	public void reg(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
	}

	/**
	 * 获取所有用户
	 * @return
	 */
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userMapper.selectByExample(null);
	}

	
	/**
	 * 批量删除用户
	 * @param ids
	 */
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where empid in (1,2,3
		criteria.andIdIn(ids);
		userMapper.deleteByExample(example);
	}

	
	/**
	 * 删除用户
	 * @param id
	 */
	public void deleteUser(Integer id) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(id);
	}

}
