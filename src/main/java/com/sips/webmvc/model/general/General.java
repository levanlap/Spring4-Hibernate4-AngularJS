package com.sips.webmvc.model.general;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "general_setting")
public class General {

	private Integer id;
	private String styleLink;
	private String backgroundLink;
	private String preHeaderBg;
	private String backgroundContentRepeat;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "styleLink", nullable = false)
	public String getStyleLink() {
		return styleLink;
	}

	public void setStyleLink(String styleLink) {
		this.styleLink = styleLink;
	}

	@Column(name = "backgroundLink", nullable = false)
	public String getBackgroundLink() {
		return backgroundLink;
	}

	public void setBackgroundLink(String backgroundLink) {
		this.backgroundLink = backgroundLink;
	}

	@Column(name = "preHeaderBg", nullable = false)
	public String getPreHeaderBg() {
		return preHeaderBg;
	}

	public void setPreHeaderBg(String preHeaderBg) {
		this.preHeaderBg = preHeaderBg;
	}
	
	@Column(name = "backgroundContentRepeat", nullable = false)
	public String getBackgroundContentRepeat() {
		return backgroundContentRepeat;
	}

	public void setBackgroundContentRepeat(String backgroundContentRepeat) {
		this.backgroundContentRepeat = backgroundContentRepeat;
	}

}
