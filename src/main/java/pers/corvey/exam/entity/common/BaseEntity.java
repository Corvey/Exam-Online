package pers.corvey.exam.entity.common;

import java.io.Serializable;
import java.util.Date;

import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.util.CurrentUtils;

public interface BaseEntity<ID extends Serializable> extends IdEntity<ID> {
	
	SysModifyLog getSysModifyLog();
	void setSysModifyLog(SysModifyLog sysModifyLog);
	
	/**
	 * 更新修改记录
	 * @param entity
	 */
	default void updateSysModifyLog() {
		SysUser currentUser = CurrentUtils.getCurrentUser();
		Date nowDate = new Date();
		SysModifyLog modifyLog = getSysModifyLog();
		if (modifyLog == null) {	// modifyLog为空，即新增操作
			modifyLog = new SysModifyLog();
			modifyLog.setCreateDate(nowDate);
			modifyLog.setCreator(currentUser);
			setSysModifyLog(modifyLog);
		} else {	// modifyLog不为空，即更新操作
			modifyLog.setModifiedDate(nowDate);
			modifyLog.setModifier(currentUser);
		}
	}
}
