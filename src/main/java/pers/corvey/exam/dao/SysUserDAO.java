package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.sys.SysUser;

public interface SysUserDAO extends CrudRepository<SysUser, Long> {

	SysUser findByUsername(String username);
	Iterable<SysUser> findByNameStartingWith(String keyword);
}
