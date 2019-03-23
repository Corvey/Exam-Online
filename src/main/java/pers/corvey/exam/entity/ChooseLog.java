package pers.corvey.exam.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import pers.corvey.exam.entity.common.BaseEntityImpl;
import pers.corvey.exam.entity.sys.SysUser;

@Entity
public class ChooseLog extends BaseEntityImpl<Long> {
	
	private Exam exam;
	private Question question;
	private List<Choice> choose;
	private Boolean correct;
	private SysUser user;
	private Boolean display = true;
	
	@ManyToOne(fetch=FetchType.LAZY)
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name = "choose_log_choice")
	public List<Choice> getChoose() {
		return choose;
	}
	public void setChoose(List<Choice> choose) {
		this.choose = choose;
	}
	public Boolean getCorrect() {
		return correct;
	}
	public void setCorrect(Boolean correct) {
		this.correct = correct;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	public SysUser getUser() {
		return user;
	}
	public void setUser(SysUser user) {
		this.user = user;
	}
	
	public Boolean getDisplay() {
		return display;
	}
	public void setDisplay(Boolean display) {
		this.display = display;
	}
}
