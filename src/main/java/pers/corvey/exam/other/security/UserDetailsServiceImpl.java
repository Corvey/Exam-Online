package pers.corvey.exam.other.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pers.corvey.exam.dao.SysUserDAO;
import pers.corvey.exam.entity.sys.SysUser;

@Service
@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private SysUserDAO sysUserDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		SysUser user = sysUserDAO.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("不存在此用户");
		}
		user.getAuthorities();	// 触发懒加载
		return user;
	}

}
