package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import pers.corvey.exam.entity.common.BaseComment;

@Entity
public class QuestionComment extends BaseComment {

	private Question question;
	
	@ManyToOne(fetch=FetchType.LAZY)
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
}
