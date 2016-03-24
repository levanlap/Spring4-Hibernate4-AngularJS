package com.sips.webmvc.model.product;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	private Integer id;
	private String catalogIds;
	private String name;
	private String friendURL;
	private Double smallPrice;
	private Double mediumPrice;
	private Double largePrice;
	private String content;
	private Double discountSmallPrice;
	private Double discountMediumPrice;
	private Double discountLargePrice;
	private String imageLink;
	private String imageList;
	private Date createdDate;
	private Integer view;
	private String status;
	private String orderNote;
	private String detailNote;
	private String code;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "catalog_ids")
	public String getCatalogIds() {
		return catalogIds;
	}

	public void setCatalogIds(String catalogIds) {
		this.catalogIds = catalogIds;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "friend_url", nullable = false, length = 200)
	public String getFriendURL() {
		return friendURL;
	}

	public void setFriendURL(String friendURL) {
		this.friendURL = friendURL;
	}

	@Column(name = "small_price", nullable = true)
	public Double getSmallPrice() {
		return smallPrice;
	}

	public void setSmallPrice(Double smallPrice) {
		this.smallPrice = smallPrice;
	}


	@Column(name = "medium_price", nullable = true)
	public Double getMediumPrice() {
		return mediumPrice;
	}

	public void setMediumPrice(Double mediumPrice) {
		this.mediumPrice = mediumPrice;
	}

	@Column(name = "large_price", nullable = true)
	public Double getLargePrice() {
		return largePrice;
	}

	public void setLargePrice(Double largePrice) {
		this.largePrice = largePrice;
	}

	@Column(name = "content", nullable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "discount_small_price", nullable = true)
	public Double getDiscountSmallPrice() {
		return discountSmallPrice;
	}

	public void setDiscountSmallPrice(Double discountSmallPrice) {
		this.discountSmallPrice = discountSmallPrice;
	}

	@Column(name = "discount_medium_price", nullable = true)
	public Double getDiscountMediumPrice() {
		return discountMediumPrice;
	}

	public void setDiscountMediumPrice(Double discountMediumPrice) {
		this.discountMediumPrice = discountMediumPrice;
	}

	@Column(name = "discount_large_price", nullable = true)
	public Double getDiscountLargePrice() {
		return discountLargePrice;
	}

	public void setDiscountLargePrice(Double discountLargePrice) {
		this.discountLargePrice = discountLargePrice;
	}

	@Column(name = "image_link")
	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	@Column(name = "image_list", nullable = false)
	public String getImageList() {
		return imageList;
	}

	public void setImageList(String imageList) {
		this.imageList = imageList;
	}

	@Column(name = "created_date", nullable = false)
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "view", nullable = false)
	public Integer getView() {
		if (view == null) {
			view = 0;
		}
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	@Column(name = "status", nullable = true)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "order_note", nullable = true)
	public String getOrderNote() {
		return orderNote;
	}

	public void setOrderNote(String orderNote) {
		this.orderNote = orderNote;
	}

	@Column(name = "detail_note", nullable = true)
	public String getDetailNote() {
		return detailNote;
	}

	public void setDetailNote(String detailNote) {
		this.detailNote = detailNote;
	}

	@Column(name = "code", nullable = true)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
		Product other = (Product) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
