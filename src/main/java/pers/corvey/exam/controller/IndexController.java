package pers.corvey.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.util.CurrentUtils;

@Controller
public class IndexController {

	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}
	
	@GetMapping("/register")
	public String showRegisterPage() {
		return "register";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@GetMapping("/isadmin")
	@ResponseBody
	public Boolean test() {
		SysUser user = CurrentUtils.getCurrentUser();
		return user.getAdmin();
	}
}
