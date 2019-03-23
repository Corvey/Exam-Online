package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.sys.SysAuthority;

public interface SysAuthorityDAO extends CrudRepository<SysAuthority, Long> {
	
}
