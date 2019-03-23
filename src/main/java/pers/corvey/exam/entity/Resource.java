package pers.corvey.exam.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import pers.corvey.exam.entity.common.BaseEntityImpl;

@Entity
public class Resource extends BaseEntityImpl<Long> {

	private static final long serialVersionUID = 5215832972476878002L;

	private String name;
	private String description;
	private String fileName;
	private Long fileSize;
	private String filePath;
	private Integer price;
	private Integer downloadTimes = 0;
	private List<ResourceComment> comments;

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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getDownloadTimes() {
		return downloadTimes;
	}

	public void setDownloadTimes(Integer downloadTimes) {
		this.downloadTimes = downloadTimes;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "resource_id")
	@OrderBy("good desc")
	public List<ResourceComment> getComments() {
		return comments;
	}

	public void setComments(List<ResourceComment> comments) {
		this.comments = comments;
	}
}
