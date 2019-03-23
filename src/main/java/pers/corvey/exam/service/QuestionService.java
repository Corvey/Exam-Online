package pers.corvey.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pers.corvey.exam.dao.ChoiceDAO;
import pers.corvey.exam.dao.ExamPaperDAO;
import pers.corvey.exam.dao.QuestionDAO;
import pers.corvey.exam.entity.Choice;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.entity.Question;
import pers.corvey.exam.entity.common.IdEntity;
import pers.corvey.exam.service.common.BaseService;
import pers.corvey.exam.service.common.BaseServiceImpl;

@Service
public class QuestionService extends BaseServiceImpl<Question, Long> {

	private final QuestionDAO questionDAO;
	private final ChoiceDAO choiceDAO;
	private final ExamPaperDAO examPaperDAO;
	
	@Autowired
	public QuestionService(QuestionDAO questionDAO, ChoiceDAO choiceDAO, 
			ExamPaperDAO examPaperDAO) {
		
		super(questionDAO);
		this.questionDAO = questionDAO;
		this.choiceDAO = choiceDAO;
		this.examPaperDAO = examPaperDAO;
		System.out.println(examPaperDAO);
	}
	
	@Override
	public Question save(Question entity) {
		List<Long> exampaperIds = entity.getExampaperIds();
		Iterable<ExamPaper> exampapers = examPaperDAO.findAll(exampaperIds);
		entity.setExampapers(BaseService.iterableTolist(exampapers));
		return super.save(entity);
	}

	// 增加注解使得hibernate自动删除无关联的数据
//	/**
//	 * 删除掉更新后不存在的旧的选项
//	 * @param newQuestion
//	 */
//	private void deleteRemovedChoices(Question newQuestion) {
//		Question oldQuestion = findByID(newQuestion.getId());
//		if (oldQuestion != null) {
//			List<Long> newChoiceIds = IdEntity.getCollectionIds(newQuestion.getChoices());
//			oldQuestion.getChoices().forEach(e -> {
//				Long id = e.getId();
//				if (!newChoiceIds.contains(id)) {
//					System.out.println("执行删除" + id);
//					choiceDAO.delete(id);
//				}
//			});
//		}
//	}
}
