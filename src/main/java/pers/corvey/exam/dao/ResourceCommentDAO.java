package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.ResourceComment;

public interface ResourceCommentDAO extends CrudRepository<ResourceComment, Long> {

}
