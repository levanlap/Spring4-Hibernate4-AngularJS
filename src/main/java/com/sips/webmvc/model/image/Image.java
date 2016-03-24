package com.sips.webmvc.model.image;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "image")
public class Image {

	private Integer id;
	private String name;
	private String fileType;
	private String url;
	private Boolean isFolder;
	private Image parent;
	private Date created;
	private List<Image> children;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "name", nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "is_folder")
	public Boolean isFolder() {
		return isFolder;
	}
	public void setFolder(Boolean isFolder) {
		this.isFolder = isFolder;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="parent_id")
	public Image getParent() {
		return parent;
	}
	public void setParent(Image parent) {
		this.parent = parent;
	}
	
	@OneToMany(mappedBy="parent", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	public List<Image> getChildren() {
		return children;
	}
	public void setChildren(List<Image> children) {
		this.children = children;
	}
	
	@Column(name = "file_type")
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	@Column(name = "created")
	public Date getCreated() {
		return created;
	}
	
	public void setCreated(Date created) {
		this.created = created;
	}
	
	
}
