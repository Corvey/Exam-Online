package pers.corvey.exam.entity.common;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import pers.corvey.exam.entity.sys.SysUser;

@Entity
public class SysModifyLog implements IdEntity<String> {
	
	private static final long serialVersionUID = 6146093577543710236L;
	
	private String id;
	private SysUser creator;
	private Date createDate;
	private SysUser modifier;
	private Date modifiedDate;
	
	public SysModifyLog() {}
	
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@Column(columnDefinition = "char(32)")
	@Override
	public String getId() {
		return id;
	}
	
	@Override
	public void setId(String id) {
		this.id = id;
	}
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "creator_user_id", updatable = false)
	public SysUser getCreator() {
		return creator;
	}
	
	public void setCreator(SysUser creator) {
		this.creator = creator;
	}
	
	@Column(updatable = false)
	public Date getCreateDate() {
		return createDate == null ? new Date() : createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "modifier_user_id")
	public SysUser getModifier() {
		return modifier;
	}
	
	public void setModifier(SysUser modifier) {
		this.modifier = modifier;
	}
	
	public Date getModifiedDate() {
		return modifiedDate;
	}
	
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	
	@Override
	public String toString() {
		return String.format("SysModifyLog[id=%s, create_date=%s, create_id=%s, modify_date=%s, modify_id=%s]", id, createDate, creator, modifiedDate, modifier);
	}
}
