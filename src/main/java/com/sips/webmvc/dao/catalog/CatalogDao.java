package com.sips.webmvc.dao.catalog;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.catalog.Catalog;

public interface CatalogDao extends GenericDao<Catalog, Integer> {

	Catalog findById(int id);

	List<Catalog> findByIds(String ids);
	
	List<Catalog> findAllCatalogs();

	Catalog saveCatalog(Catalog catalog);

	Catalog deleteCatalog(int id);
	
	List<Catalog> findRootTreeView();

	List<Catalog> findRootCatalogs();

	List<Catalog> findAllByParentId(int parentId);

	Catalog findByFriendURL(String friendURL);
	
	Catalog findParentByFriendURL(String friendURL);

	long countByParentId(int parentId);

	long countByFriendUrl(String friendURL);

	long countByFriendUrlExceptProductId(String friendURL, int catalogId);

}