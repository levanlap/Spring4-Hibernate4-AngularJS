package com.sips.webmvc.dto.catalog;

import java.util.ArrayList;
import java.util.List;

public class CatalogDTO {

	private Integer id;
	private String name;
	private String friendURL;
	private Integer parentId;
	private Integer sortOrder;
	private CatalogDTO parent;
	private long countChildren;
	private List<CatalogDTO> children;

	public CatalogDTO(Integer id, String name, String friendURL, Integer parentId,
			Integer sortOrder, int countChildren, List<CatalogDTO> children) {
		super();
		this.id = id;
		this.name = name;
		this.friendURL = friendURL;
		this.parentId = parentId;
		this.sortOrder = sortOrder;
		this.countChildren = countChildren;
		this.children = children;
	}

	public CatalogDTO() {
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

	public String getFriendURL() {
		return friendURL;
	}

	public void setFriendURL(String friendURL) {
		this.friendURL = friendURL;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}

	public CatalogDTO getParent() {
		return parent;
	}

	public void setParent(CatalogDTO parent) {
		this.parent = parent;
	}
	
	public long getCountChildren() {
		return countChildren;
	}

	public void setCountChildren(long countChildren) {
		this.countChildren = countChildren;
	}

	public List<CatalogDTO> getChildren() {
		if(children == null){
			children = new ArrayList<CatalogDTO>();
		}
		return children;
	}

	public void setChildren(List<CatalogDTO> children) {
		this.children = children;
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
		CatalogDTO other = (CatalogDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
}
