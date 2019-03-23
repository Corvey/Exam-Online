package pers.corvey.exam.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import pers.corvey.exam.entity.common.BaseEntityImpl;

@Entity
@Table(name = "exampaper")
public class ExamPaper extends BaseEntityImpl<Long> {
	
	private String name;
	private String description;
	private List<Question> questions;
	
	public ExamPaper() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.PERSIST)
	@JoinTable(name="exampaper_question")
	@OrderBy("type")
	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
}
