package cn.ltuz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ltuz.bean.Msg;
import cn.ltuz.bean.User;
import cn.ltuz.service.UserService;



@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	
	/**
	 * 用户登录
	 * @param login_name
	 * @param password
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(@RequestParam("login_name") String login_name, @RequestParam("password") String password) {
		
		boolean b = userService.login(login_name, password);
		if(b) {
			return "list";
		}else {
			return "error";
		}
		
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @param result
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reg", method = RequestMethod.POST)
	public Msg reg(@Valid User user,BindingResult result) {
		if (result.hasErrors()) {
			// 校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());

			}
			return Msg.fail().add("errorFields", map);
		} else {
			userService.reg(user);
			return Msg.success();
		}
	}
	
	/**
	 * 查询所有用户（分页查询）
	 * @param pn
	 * @return
	 */
	@RequestMapping("/users")
	@ResponseBody
	public Msg getUsers(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 这不是一个分页查询
		// 引入PageHelper分页插件
		// 在查询之前只需要调用，传入页码，以及每页大小
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<User> emps = userService.getAll();

		// 用PageInfo对结果进行包装,只需要将PageInfo交给页面就行了
		// 封装了详细的分页修信息，包括有我们查询出来的数据，传入连续显示的页数
		PageInfo page = new PageInfo(emps, 4);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 删除用户（单个删除和批量删除）
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/user/{ids}", method=RequestMethod.DELETE)
	public Msg deleteUser(@PathVariable("ids")String ids) {
		
		if(ids.contains("-")) {
			//批量删除
			List<Integer> del_ids = new ArrayList<>();
			
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			userService.deleteBatch(del_ids);
		}else {
			//单个删除
			Integer id = Integer.parseInt(ids);
			userService.deleteUser(id);
		}
			
		return Msg.success();
	}
	
	
}
