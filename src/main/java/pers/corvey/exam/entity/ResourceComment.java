package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import pers.corvey.exam.entity.common.BaseComment;

@Entity
public class ResourceComment extends BaseComment {

	private Resource resource;

	@ManyToOne(fetch=FetchType.LAZY)
	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}
	
}
