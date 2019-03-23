package pers.corvey.exam.controller.sys;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pers.corvey.exam.controller.common.BaseControllerImpl;
import pers.corvey.exam.entity.sys.SysAuthority;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.service.sys.SysAuthorityService;
import pers.corvey.exam.service.sys.SysUserService;

@Controller
@RequestMapping("/sys/user")
public class SysUserController extends BaseControllerImpl<SysUser, Long> {

	private final SysUserService sysUserService;
	
	private final SysAuthorityService sysAuthorityService;
	
	@Autowired
	public SysUserController(SysUserService sysUserService, 
			SysAuthorityService sysAuthorityService) {
		
		super(sysUserService, "sys/user-input.jsp", "sys/user-list.jsp");
		this.sysUserService = sysUserService;
		this.sysAuthorityService = sysAuthorityService;
	}
	
	/**
	 * 保存记录
	 * @param user
	 * @param ids
	 * @return
	 */
	@PostMapping(SAVE_PATH)
	public String save(@ModelAttribute("entity") SysUser user,
			@RequestParam(name="authorityIds", required=false) List<Byte> authorityIds) {
		if (user.getMoney() == null) {
			user.setMoney(10);
		}
		Set<SysAuthority> authorities = sysAuthorityService.findAll(authorityIds);
		authorities.add(sysAuthorityService.getDefaultAuthority());
		user.setAuthorities(authorities);
		return baseSave(user);
	}
	
	@PostMapping("/search")
	public String search(Model model, @RequestParam("keyword") String keyword) {
		return baseShowListView(model, sysUserService.search(keyword));
	}
	
	@Override
	public String showInputView(Model model, @ModelAttribute("entity") SysUser entity) {
		Iterable<SysAuthority> authorities = sysAuthorityService.findAll();
		model.addAttribute("authorities", authorities);
		return super.showInputView(model, entity);
	}
	
	@Override
	public String showDetailView(Model model, @ModelAttribute("entity") SysUser entity) {
		Iterable<SysAuthority> authorities = sysAuthorityService.findAll();
		model.addAttribute("authorities", authorities);
		return super.showDetailView(model, entity);
	}
}
