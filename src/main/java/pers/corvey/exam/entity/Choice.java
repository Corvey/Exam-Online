package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import pers.corvey.exam.entity.common.BaseEntityImpl;

@Entity
public class Choice extends BaseEntityImpl<Long> {

	private String content;
	private Boolean answer;
	private Question question;
	
	public Choice() {}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getAnswer() {
		return answer;
	}

	public void setAnswer(Boolean answer) {
		this.answer = answer;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}
	
	@Override
	public String toString() {
		return String.format("Choice[content: %s, answer: %s]\n", content, answer);
	}
}
