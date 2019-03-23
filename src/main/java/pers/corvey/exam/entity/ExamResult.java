package pers.corvey.exam.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import pers.corvey.exam.entity.common.BaseEntityImpl;
import pers.corvey.exam.entity.sys.SysUser;

@Entity
public class ExamResult extends BaseEntityImpl<Long> {
	
	private Exam exam;
	private SysUser user;
	private Integer allCount;
	private Integer wrongCount;
	private Integer grade;
	private Integer rank;
	
	@ManyToOne(fetch = FetchType.LAZY)
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	public SysUser getUser() {
		return user;
	}
	public void setUser(SysUser user) {
		this.user = user;
	}
	public Integer getWrongCount() {
		return wrongCount;
	}
	public void setWrongCount(Integer wrongCount) {
		this.wrongCount = wrongCount;
	}
	public Integer getAllCount() {
		return allCount;
	}
	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	
	@Transient
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	
//	JSP用到的方法
	@Transient
	public Long getUserId() {
		return user == null ? (long)1 : user.getId();
	}
	
	@Transient
	public Long getExamId() {
		return exam == null ? (long)1 : exam.getId();
	}
}
