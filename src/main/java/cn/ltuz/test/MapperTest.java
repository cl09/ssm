package cn.ltuz.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.ltuz.bean.User;
import cn.ltuz.dao.UserMapper;


/**
 * 测试DAO层工作
 * @author xxzx
 *推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位置
 *3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 测试
	 */
	@Test
	public void test() {
		
		System.out.println(userMapper);
		
		
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		for (int i = 0; i < 100; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new User(null,uid,"123456",""));
		}
		System.out.println("批量完成");
	}

}
