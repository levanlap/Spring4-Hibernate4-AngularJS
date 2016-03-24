package com.sips.webmvc.dao.page;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.page.Page;

public interface PageDao extends GenericDao<Page, Integer> {

	Page findById(int id);

	List<Page> findAllPages();

	Page savePage(Page page);

	Page deletePage(int id);
	
	List<Page> findRootTreeView();

	List<Page> findRootPages();

	Page findByFriendURL(String friendURL);

	long countByFriendUrlExceptPageId(String friendURL, int pageId);

}