package com.sips.webmvc.dto.blog;

import java.util.Date;

import com.sips.webmvc.dto.image.ImageDTO;

public class BlogDTO {

	private Integer id;
	private String title;
	private String friendURL;
	private ImageDTO image;
	private String content;
	private Date createdDate;
	private long total;
	private String shortContent;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFriendURL() {
		return friendURL;
	}

	public void setFriendURL(String friendURL) {
		this.friendURL = friendURL;
	}

	public ImageDTO getImage() {
		return image;
	}

	public void setImage(ImageDTO image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public String getShortContent() {
		if (content.length() > 80)
			return content.substring(0, 80) + "...";
		else
			return content;
	}

	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
	}

}
