package pers.corvey.exam.entity.common;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import pers.corvey.exam.entity.sys.SysUser;

@MappedSuperclass
public class BaseComment extends BaseEntityImpl<Long> {
	
	private SysUser user;
	private String content;
	private Integer good = 0;
	
	@ManyToOne(fetch=FetchType.EAGER)
	public SysUser getUser() {
		return user;
	}
	public void setUser(SysUser user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getGood() {
		return good;
	}
	public void setGood(Integer good) {
		this.good = good;
	}
}
