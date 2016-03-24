package com.sips.webmvc.dto.connect_link;

import com.sips.webmvc.dto.image.ImageDTO;

public class ConnectLinkDTO {

	private Integer id;
	private String name;
	private String link;
	private String linkImage;
	private String type;
	private ImageDTO imageLink;
	private Integer sortOrder;
	
	public ConnectLinkDTO() {
	}

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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public ImageDTO getImageLink() {
		return imageLink;
	}

	public void setImageLink(ImageDTO imageLink) {
		this.imageLink = imageLink;
	}

	public Integer getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}
	
}
