package pers.corvey.exam.entity.common;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;


/**
 * 注意：子类必须要有空的构造方法 
 * @author Corvey
 * @param <ID>
 */
@MappedSuperclass
public abstract class BaseEntityImpl<ID extends Serializable> implements BaseEntity<ID> {

	private static final long serialVersionUID = -290755885790882631L;
	
	protected ID id;
	protected SysModifyLog sysModifyLog;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Override
	public ID getId() {
		return id;
	}
	
	@Override
	public void setId(ID id) {
		this.id = id;
	}

	@OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@Override
	public SysModifyLog getSysModifyLog() {
		return sysModifyLog;
	}
	
	@Override
	public void setSysModifyLog(SysModifyLog sysModifyLog) {
		this.sysModifyLog = sysModifyLog;
	}
}
