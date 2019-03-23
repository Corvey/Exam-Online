package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.Exam;

public interface ExamDAO extends CrudRepository<Exam, Long> {

	Iterable<Exam> findByNameStartingWith(String keyword);
	
}
