package com.sips.webmvc.dto.general;

public class GeneralDTO {

	private Integer id;
	private String styleLink;
	private String backgroundLink;
	private String styleColor;
	private String preHeaderBg;
	private String backgroundContentRepeat;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStyleLink() {
		return styleLink;
	}

	public void setStyleLink(String styleLink) {
		this.styleLink = styleLink;
	}

	public String getBackgroundLink() {
		return backgroundLink;
	}

	public void setBackgroundLink(String backgroundLink) {
		this.backgroundLink = backgroundLink;
	}

	public String getStyleColor() {
		return styleColor;
	}

	public void setStyleColor(String styleColor) {
		this.styleColor = styleColor;
	}

	public String getPreHeaderBg() {
		return preHeaderBg;
	}

	public void setPreHeaderBg(String preHeaderBg) {
		this.preHeaderBg = preHeaderBg;
	}

	public String getBackgroundContentRepeat() {
		return backgroundContentRepeat;
	}

	public void setBackgroundContentRepeat(String backgroundContentRepeat) {
		this.backgroundContentRepeat = backgroundContentRepeat;
	}

}
