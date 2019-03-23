package pers.corvey.exam.helper.form;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import pers.corvey.exam.entity.Choice;
import pers.corvey.exam.entity.ExamPaper;
import pers.corvey.exam.entity.Question;

public class QuestionFormHelper {

	private List<Choice> newChoices;
	private List<Long> deleteChoiceIds;
	private List<Long> exampaperIds;
	
	public void updateToQuestion(Question question) {
		List<Choice> choices = Optional.ofNullable(question.getChoices()).orElse(new ArrayList<>());
		System.out.println("----------------------");
		if (deleteChoiceIds != null) {	// 删除选项
			for (Iterator<Choice> iter = choices.iterator(); iter.hasNext(); ) {
				Choice choice = iter.next();
				if (deleteChoiceIds.contains(choice.getId())) {
					iter.remove();
				}
			}
		}
		if (newChoices != null) {	// 增加新选项
			newChoices.forEach(e -> {
				if (e.getAnswer() != null) {
					e.setQuestion(question);
					choices.add(e);
				}
			});
		}
		question.setChoices(choices);
		
		List<ExamPaper> examPapers = new ArrayList<>();
		if (exampaperIds != null) {	// 重置所属试卷
			exampaperIds.forEach(id -> {
				ExamPaper examPaper = new ExamPaper();
				examPaper.setId(id);
				examPapers.add(examPaper);
			});
		}
		question.setExampapers(examPapers);
	}
	
	public List<Choice> getNewChoices() {
		return newChoices;
	}
	
	public void setNewChoices(List<Choice> newChoices) {
		this.newChoices = newChoices;
	}

	public List<Long> getDeleteChoiceIds() {
		return deleteChoiceIds;
	}
	
	public void setDeleteChoiceIds(List<Long> deleteChoiceIds) {
		this.deleteChoiceIds = deleteChoiceIds;
	}
	
	public List<Long> getExampaperIds() {
		return exampaperIds;
	}

	public void setExampaperIds(List<Long> exampaperIds) {
		this.exampaperIds = exampaperIds;
	}
}
