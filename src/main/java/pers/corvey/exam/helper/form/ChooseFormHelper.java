package pers.corvey.exam.helper.form;

import java.util.ArrayList;
import java.util.List;

import pers.corvey.exam.entity.Choice;
import pers.corvey.exam.entity.ChooseLog;
import pers.corvey.exam.entity.Exam;
import pers.corvey.exam.entity.Question;

public class ChooseFormHelper {

	private Long examId;
	private List<Long> questionIds;
	private List<List<Long>> chooses;
	
	public Long getExamId() {
		return examId;
	}
	public void setExamId(Long examId) {
		this.examId = examId;
	}
	public List<Long> getQuestionIds() {
		return questionIds;
	}
	public void setQuestionIds(List<Long> questionIds) {
		this.questionIds = questionIds;
	}
	public List<List<Long>> getChooses() {
		return chooses;
	}
	public void setChooses(List<List<Long>> chooses) {
		this.chooses = chooses;
	}
	
	public List<ChooseLog> generateChooseLog() {
		List<ChooseLog> logs = new ArrayList<>();
		for (int i=0; i<chooses.size(); ++i) {
			ChooseLog log = new ChooseLog();
			
			Exam exam = new Exam();
			exam.setId(examId);
			log.setExam(exam);
			
			Question question = new Question();
			question.setId(questionIds.get(i));
			log.setQuestion(question);
			
			List<Choice> choices = new ArrayList<>();
			List<Long> choiceIds = chooses.get(i);
			if (choiceIds != null && choiceIds.size() > 0) {
				for (Long id : choiceIds) {
					if (id != null) {
						Choice choice = new Choice();
						choice.setId(id);
						choices.add(choice);
					}
				}
			}
			log.setChoose(choices);
			logs.add(log);
		}
		return logs;
	}
	
}
