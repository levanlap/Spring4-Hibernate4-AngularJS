package com.sips.webmvc.service.catalog;

import java.util.List;

import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.model.catalog.Catalog;

public interface CatalogService {
	CatalogDTO toDTO(Catalog catalog);

	List<CatalogDTO> toDTOs(List<Catalog> catalogs, boolean isCopyChildren);

	CatalogDTO findById(int id);
	
	List<CatalogDTO> findByIds(String ids);

	List<CatalogDTO> findAllCatalogs();

	List<CatalogDTO> findRootTreeView();

	List<CatalogDTO> getTreeCatalogs();

	List<CatalogDTO> getSelectionCatalogs();

	List<CatalogDTO> getSelectionCatalogs(List<CatalogDTO> treeCatalogs,
			int exceptIdAndChildren, int level);

	CatalogDTO saveCatalog(CatalogDTO dto);

	CatalogDTO deleteCatalog(int id);

	void update(Catalog catalog);

	void remove(int id);

	Catalog toEntite(CatalogDTO dto);
	
	CatalogDTO getByFriendURL(String friendURL);

	CatalogDTO getParentByFriendURL(String friendURL);

	boolean canDeleteById(int id);
	
	long countByFriendUrl(String friendURL);

	long countByFriendUrlExceptProductId(String friendURL, int catalogId);

}
