package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.Question;

public interface QuestionDAO extends CrudRepository<Question, Long> {

}
