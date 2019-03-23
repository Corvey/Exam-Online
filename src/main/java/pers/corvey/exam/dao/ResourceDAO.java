package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.Resource;

public interface ResourceDAO extends CrudRepository<Resource, Long> {

	Iterable<Resource> findByNameStartingWith(String keyword);
	
}
