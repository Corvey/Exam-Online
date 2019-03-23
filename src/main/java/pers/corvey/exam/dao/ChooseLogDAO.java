package pers.corvey.exam.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.ChooseLog;

public interface ChooseLogDAO extends CrudRepository<ChooseLog, Long> {

	@Query(value = "select * from choose_log where sys_user_id = ?2 and exam_id = ?1", 
			nativeQuery = true)
	List<ChooseLog> findByExamIdAndUserId(Long examId, Long userId);
	
	@Query(value = "select * from choose_log where sys_user_id = ?1 "
			+ "and display = 1 and correct = 0", nativeQuery = true)
	List<ChooseLog> findWrongByUserId(Long userId);
}
