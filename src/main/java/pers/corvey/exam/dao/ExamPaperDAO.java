package pers.corvey.exam.dao;

import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.ExamPaper;

public interface ExamPaperDAO extends CrudRepository<ExamPaper, Long> {

	Iterable<ExamPaper> findByNameStartingWith(String keyword);
}
