package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.common.SysModifyLog;

public interface SysModifyLogDAO extends CrudRepository<SysModifyLog, String> {

}
