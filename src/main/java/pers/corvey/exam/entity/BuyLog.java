package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import pers.corvey.exam.entity.common.BaseEntityImpl;
import pers.corvey.exam.entity.sys.SysUser;

@Entity
public class BuyLog extends BaseEntityImpl<Long> {

	private Resource resource;
	private SysUser user;
	private Integer spending;

	@ManyToOne(fetch=FetchType.LAZY)
	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	public Integer getSpending() {
		return spending;
	}

	public void setSpending(Integer spending) {
		this.spending = spending;
	}

}
