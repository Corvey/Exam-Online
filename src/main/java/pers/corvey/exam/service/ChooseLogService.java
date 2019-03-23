package pers.corvey.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ChoiceDAO;
import pers.corvey.exam.dao.ChooseLogDAO;
import pers.corvey.exam.dao.ExamDAO;
import pers.corvey.exam.dao.ExamResultDAO;
import pers.corvey.exam.dao.QuestionDAO;
import pers.corvey.exam.entity.ChooseLog;
import pers.corvey.exam.entity.common.IdEntity;
import pers.corvey.exam.service.common.BaseService;
import pers.corvey.exam.service.common.BaseServiceImpl;
import pers.corvey.exam.util.CurrentUtils;

@Service
public class ChooseLogService extends BaseServiceImpl<ChooseLog, Long> {

	private final ChooseLogDAO dao;
	private final ExamDAO examDAO;
	private final QuestionDAO questionDAO;
	private final ChoiceDAO choiceDAO;
	private final ExamResultDAO examResultDAO;
	
	@Autowired
	public ChooseLogService(ChooseLogDAO dao, ExamDAO examDAO, ChoiceDAO choiceDAO,
			QuestionDAO questionDAO, ExamResultDAO examResultDAO) {
		
		super(dao);
		this.dao = dao;
		this.examDAO = examDAO;
		this.questionDAO = questionDAO;
		this.choiceDAO = choiceDAO;
		this.examResultDAO = examResultDAO;
	}
	
	@Override
	public ChooseLog save(ChooseLog entity) {
		Long examId = entity.getExam().getId();
		entity.setExam(examDAO.findOne(examId));
		Long questionId = entity.getQuestion().getId();
		entity.setQuestion(questionDAO.findOne(questionId));
		List<Long> choiceIds = IdEntity.getCollectionIds(entity.getChoose());
		entity.setChoose(BaseService.iterableTolist(choiceDAO.findAll(choiceIds)));
		judge(entity);
		entity.setUser(CurrentUtils.getCurrentUser());
		return super.save(entity);
	}

	public List<ChooseLog> findByExamIdAndUserId(Long examId, Long userId) {
		return dao.findByExamIdAndUserId(examId, userId);
	}
	
	public boolean judge(ChooseLog chooseLog) {
		List<Long> answerIds = IdEntity.getCollectionIds(chooseLog.getQuestion().getAnswers());
		List<Long> chooseIds = IdEntity.getCollectionIds(chooseLog.getChoose());
		boolean right = chooseIds != null && chooseIds.size() == answerIds.size() 
				&& chooseIds.containsAll(answerIds);
		chooseLog.setCorrect(right);
		chooseLog.setDisplay(right ? false : true);
		return right;
	}
	
	public List<ChooseLog> getUserWrong(Long userId) {
		return dao.findWrongByUserId(userId);
	}
	
	public void hideChooseLog(Long chooseLogId) {
		ChooseLog log = dao.findOne(chooseLogId);
		log.setDisplay(false);
		dao.save(log);
	}
}
