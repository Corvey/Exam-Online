package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.QuestionComment;

public interface QuestionCommentDAO extends CrudRepository<QuestionComment, Long> {
	
}
