package com.sips.webmvc.dto.product;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.dto.image.ImageDTO;

public class ProductDTO {

	private Integer id;
	private List<CatalogDTO> catalogs;
	private String catalogIds;
	private String oldCatalogIds;
	private String name;
	private String oldName; // Is used in case check existed
	private String friendURL;
	private Double smallPrice;
	private Double mediumPrice;
	private Double largePrice;
	private String content;
	private Double discountSmallPrice;
	private Double discountMediumPrice;
	private Double discountLargePrice;
	private ImageDTO imageLink;
	private List<ImageDTO> imageList;
	private Date createdDate;
	private Integer view;
	private String status;
	private Integer bestSellers;
	private String orderNote;
	private String detailNote;
	private String code;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<CatalogDTO> getCatalogs() {
		return catalogs;
	}

	public void setCatalogs(List<CatalogDTO> catalogs) {
		this.catalogs = catalogs;
	}
	
	public String getCatalogIds() {
		return catalogIds;
	}

	public void setCatalogIds(String catalogIds) {
		this.catalogIds = catalogIds;
	}
	

	public String getOldCatalogIds() {
		return oldCatalogIds;
	}

	public void setOldCatalogIds(String oldCatalogIds) {
		this.oldCatalogIds = oldCatalogIds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getOldName() {
		return oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public String getFriendURL() {
		return friendURL;
	}

	public void setFriendURL(String friendURL) {
		this.friendURL = friendURL;
	}

	public Double getSmallPrice() {
		return smallPrice;
	}

	public void setSmallPrice(Double smallPrice) {
		this.smallPrice = smallPrice;
	}

	public Double getMediumPrice() {
		return mediumPrice;
	}

	public void setMediumPrice(Double mediumPrice) {
		this.mediumPrice = mediumPrice;
	}

	public Double getLargePrice() {
		return largePrice;
	}

	public void setLargePrice(Double largePrice) {
		this.largePrice = largePrice;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Double getDiscountSmallPrice() {
		return discountSmallPrice;
	}

	public void setDiscountSmallPrice(Double discountSmallPrice) {
		this.discountSmallPrice = discountSmallPrice;
	}

	public Double getDiscountMediumPrice() {
		return discountMediumPrice;
	}

	public void setDiscountMediumPrice(Double discountMediumPrice) {
		this.discountMediumPrice = discountMediumPrice;
	}

	public Double getDiscountLargePrice() {
		return discountLargePrice;
	}

	public void setDiscountLargePrice(Double discountLargePrice) {
		this.discountLargePrice = discountLargePrice;
	}

	public ImageDTO getImageLink() {
		return imageLink;
	}

	public void setImageLink(ImageDTO imageLink) {
		this.imageLink = imageLink;
	}

	public List<ImageDTO> getImageList() {
		if(imageList == null){
			imageList = new ArrayList<ImageDTO>();
		}
		return imageList;
	}

	public void setImageList(List<ImageDTO> imageList) {
		if( imageList == null ){
			imageList = new ArrayList<ImageDTO>();
		}
		this.imageList = imageList;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getView() {
		if (view == null) {
			view = 0;
		}
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getBestSellers() {
		return bestSellers;
	}

	public void setBestSellers(Integer bestSellers) {
		this.bestSellers = bestSellers;
	}

	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	public String getDetailNote() {
		return detailNote;
	}

	public void setDetailNote(String detailNote) {
		this.detailNote = detailNote;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
