package com.sips.webmvc.service.page;

import java.util.List;

import com.sips.webmvc.dto.page.PageDTO;
import com.sips.webmvc.model.page.Page;

public interface PageService {
	PageDTO toDTO(Page page);

	List<PageDTO> toDTOs(List<Page> pages, boolean isCopyChildren);

	PageDTO findById(int id);

	List<PageDTO> findAllPages();

	List<PageDTO> findRootTreeView();

	List<PageDTO> getTreePages();

	List<PageDTO> getSelectionPages();

	List<PageDTO> getSelectionPages(List<PageDTO> treePages,
			int exceptIdAndChildren, int level);

	PageDTO savePage(PageDTO dto);

	PageDTO deletePage(int id);

	void update(Page page);

	void remove(int id);

	Page toEntite(PageDTO dto);
	
	PageDTO getByFriendURL(String friendURL);

	long countByFriendUrlExceptPageId(String friendURL, int pageId);
	
}
