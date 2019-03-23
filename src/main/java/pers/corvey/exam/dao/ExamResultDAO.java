package pers.corvey.exam.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import pers.corvey.exam.entity.ExamResult;
import pers.corvey.exam.entity.sys.SysUser;

public interface ExamResultDAO extends CrudRepository<ExamResult, Long> {

	@Query(value = "select * from exam_result where sys_user_id = ?2 and exam_id = ?1 order by id desc limit 1", 
			nativeQuery = true)
	ExamResult findByExamIdAndUserId(Long examId, Long userId);
	
	@Query(value = "select count(*) from exam_result where sys_user_id = ?2 and exam_id = ?1", 
			nativeQuery = true)
	Integer countByExamIdAndUserId(Long examId, Long userId);
	
	@Query(value = "select * from exam_result where sys_user_id = ?1", nativeQuery = true)
	List<ExamResult> findByUserId(Long userId);
}
