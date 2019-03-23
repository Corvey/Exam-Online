package pers.corvey.exam.service.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import pers.corvey.exam.dao.SysAuthorityDAO;
import pers.corvey.exam.entity.sys.SysAuthority;

@Service
@Transactional
public class SysAuthorityService {

	private static List<SysAuthority> ALL_SYS_AUTHORITY = new ArrayList<>();
	private static Map<Byte, SysAuthority> ID_TO_SYS_AUTHORITY = new HashMap<>();
	private static Map<String, SysAuthority> NAME_TO_SYS_AUTHORITY = new HashMap<>();
	private static SysAuthority DEFAULT_SYS_AUTHORITY;
	
	private final SysAuthorityDAO dao;
	
	@Autowired
	public SysAuthorityService(SysAuthorityDAO dao) {
		this.dao = dao;
		Iterable<SysAuthority> authorities = dao.findAll();
		Assert.notNull(authorities, "权限表没数据？");
		authorities.forEach(e -> {
			ALL_SYS_AUTHORITY.add(e);
			ID_TO_SYS_AUTHORITY.put(e.getId(), e);
			NAME_TO_SYS_AUTHORITY.put(e.getAuthority(), e);
		});
		DEFAULT_SYS_AUTHORITY = NAME_TO_SYS_AUTHORITY.get("ROLE_USER");
	}
	
	public List<SysAuthority> findAll() {
		return ALL_SYS_AUTHORITY;
	}
	
	public Set<SysAuthority> findAll(Iterable<Byte> ids) {
		Set<SysAuthority> authorities = new HashSet<>();
		if (ids != null) {
			ids.forEach(id -> {
				SysAuthority authority = ID_TO_SYS_AUTHORITY.get(id);
				if (id != null) {
					authorities.add(authority);
				}
			});
		}
		return authorities;
	}
	
	public SysAuthority getDefaultAuthority() {
		return DEFAULT_SYS_AUTHORITY;
	}
}
