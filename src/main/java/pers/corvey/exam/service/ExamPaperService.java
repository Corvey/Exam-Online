package pers.corvey.exam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ExamPaperDAO;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class ExamPaperService extends BaseServiceImpl<ExamPaper, Long> {

	private final ExamPaperDAO examPaperDAO;
	
	@Autowired
	public ExamPaperService(ExamPaperDAO examPaperDAO) {
		super(examPaperDAO);
		this.examPaperDAO = examPaperDAO;
	}

	public Iterable<ExamPaper> search(String keyword) {
		return examPaperDAO.findByNameStartingWith(keyword);
	}
	
}
