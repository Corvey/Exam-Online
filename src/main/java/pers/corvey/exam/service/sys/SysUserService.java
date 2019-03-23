package pers.corvey.exam.service.sys;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.SysUserDAO;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class SysUserService extends BaseServiceImpl<SysUser, Long> {

	private static final Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
	
	private final SysUserDAO sysUserDAO;
	
	@Autowired
	public SysUserService(SysUserDAO sysUserDAO) {
		super(sysUserDAO);
		this.sysUserDAO = sysUserDAO;
	}

	@Override
	public SysUser save(SysUser entity) {
		if (StringUtils.isNotBlank(entity.getPassword())) {		
			// 密码不为空时，加密
			String password = md5PasswordEncoder.encodePassword(entity.getPassword(), entity.getUsername());
			entity.setPassword(password);
		} else if (entity.getId() != null) {	
			// 当id不为空而密码为空时即更新操作，找到旧密码放入避免更新成空值
			SysUser user = sysUserDAO.findOne(entity.getId());
			entity.setPassword(user.getPassword());
		}
		return super.save(entity);
	}
	
	public Iterable<SysUser> search(String keyword) {
		return sysUserDAO.findByNameStartingWith(keyword);
	}
}
