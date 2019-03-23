package pers.corvey.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ResourceDAO;
import pers.corvey.exam.entity.Resource;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class ResourceService extends BaseServiceImpl<Resource, Long> {

	private final ResourceDAO dao;
	
	@Autowired
	public ResourceService(ResourceDAO dao) {
		super(dao);
		this.dao = dao;
	}

	public Iterable<Resource> search(String keyword) {
		return dao.findByNameStartingWith(keyword);
	}
}
