package pers.corvey.exam.entity;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import pers.corvey.exam.entity.common.BaseEntityImpl;
import pers.corvey.exam.entity.common.IdEntity;

@Entity
public class Question extends BaseEntityImpl<Long> {

	private String type;	// 判断，单选，多选
	private String content;
	private List<ExamPaper> exampapers;
	private List<Choice> choices;
	private List<QuestionComment> comments;
	
	public Question() {}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="exampaper_question")
	public List<ExamPaper> getExampapers() {
		return exampapers;
	}

	public void setExampapers(List<ExamPaper> exampapers) {
		this.exampapers = exampapers;
	}
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name="question_id")
	public List<Choice> getChoices() {
		return choices;
	}

	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name="question_id")
	@OrderBy("good desc")
	public List<QuestionComment> getComments() {
		return comments;
	}

	public void setComments(List<QuestionComment> comments) {
		this.comments = comments;
	}
	
	@Transient
	public List<Choice> getAnswers() {
		if (getChoices() != null) {
			return getChoices().stream()
					.filter(e -> e.getAnswer() == true)
					.collect(Collectors.toList());
		}
		return null;
	}
	
	// JSP用到的方法
	@Transient
	public List<Long> getExampaperIds() {
		return IdEntity.getCollectionIds(exampapers);
	}
}
