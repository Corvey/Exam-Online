package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import pers.corvey.exam.entity.common.BaseEntityImpl;

@Entity
public class Exam extends BaseEntityImpl<Long> {

	private String name;
	private String description;
	private Integer time;
	private ExamPaper exampaper;
	
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
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	public ExamPaper getExampaper() {
		return exampaper;
	}
	public void setExampaper(ExamPaper exampaper) {
		this.exampaper = exampaper;
	}
	
//	JSP用到的方法
	@Transient
	public Long getExampaperId() {
		return exampaper == null ? null : exampaper.getId(); 
	}
}
