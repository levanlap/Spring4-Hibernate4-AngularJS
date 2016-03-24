package com.sips.webmvc.dto.image;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ImageDTO {

	private Integer id;
	private String name;
	private String fileType;
	private String originName;// User on GUI
	private String url;
	private Boolean isFolder;
	private ImageDTO parent;
	private Integer parentId; // User on GUI
	private Date created;
	private List<ImageDTO> children;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public ImageDTO getParent() {
		return parent;
	}
	public void setParent(ImageDTO parent) {
		this.parent = parent;
	}
	public Boolean isFolder() {
		return isFolder;
	}
	public void setFolder(Boolean isFolder) {
		this.isFolder = isFolder;
	}
	public String getUrl() {
		if(url != null && url.indexOf("/") != 0){
			url = "/" + url;
		}
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<ImageDTO> getChildren() {
		if(children == null){
			children = new ArrayList<ImageDTO>();
		}
		return children;
	}
	public void setChildren(List<ImageDTO> children) {
		this.children = children;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ImageDTO other = (ImageDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
