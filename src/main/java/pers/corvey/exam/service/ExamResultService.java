package pers.corvey.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ExamResultDAO;
import pers.corvey.exam.entity.ChooseLog;
import pers.corvey.exam.entity.ExamResult;
import pers.corvey.exam.entity.sys.SysUser;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class ExamResultService extends BaseServiceImpl<ExamResult, Long> {

	private final ExamResultDAO dao;

	@Autowired
	public ExamResultService(ExamResultDAO dao) {
		super(dao);
		this.dao = dao;
	}
	
	public ExamResult findByExamIdAndUserId(Long examId, Long userId) {
		return dao.findByExamIdAndUserId(examId, userId);
	}
	
	public Integer countByExamIdAndUserId(Long examId, Long userId) {
		return dao.countByExamIdAndUserId(examId, userId);
	}
	
	public List<ExamResult> findByUserId(Long userId) {
		return dao.findByUserId(userId);
	}
	
	public ExamResult chooseToExamResult(List<ChooseLog> chooseLogs) {
		int count = chooseLogs.size();
		int rightCount = 0;
		for (ChooseLog log : chooseLogs) {
			if (log.getCorrect()) {
				++rightCount;
			}
		}
		int grade = 100 * rightCount / count;
		
		ExamResult examResult = new ExamResult();
		examResult.setExam(chooseLogs.get(0).getExam());
		examResult.setUser(chooseLogs.get(0).getUser());
		examResult.setAllCount(count);
		examResult.setWrongCount(count - rightCount);
		examResult.setGrade(grade);
		return save(examResult);
	}
}
