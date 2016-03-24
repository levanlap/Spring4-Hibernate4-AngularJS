package com.sips.webmvc.service.page;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.page.PageDao;
import com.sips.webmvc.dao.product.ProductDao;
import com.sips.webmvc.dto.page.PageDTO;
import com.sips.webmvc.model.page.Page;

@Service
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDao pageDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public PageDTO toDTO(Page entity) {
		if(entity == null){
			return null;
		}
		PageDTO dto = new PageDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setFriendURL(entity.getFriendURL());
		dto.setSortOrder(entity.getSortOrder());
		dto.setContent(entity.getContent());
		return dto;
	}
	
	@Override
	public Page toEntite(PageDTO dto) {
		Page entity = new Page();
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		entity.setFriendURL(dto.getFriendURL());
		entity.setSortOrder(dto.getSortOrder());
		entity.setContent(dto.getContent());
		return entity;
	}

	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> toDTOs(List<Page> pages, boolean isCopyChildren) {
		List<PageDTO> dtos = new ArrayList<PageDTO>();
		if( pages != null && pages.size() > 0){
			for( Page c : pages ){
				PageDTO dto = toDTO(c);
				dtos.add(dto);
			}
		}
		return dtos;
	}

	@Override
	@Transactional(readOnly = true)
	public PageDTO findById(int id) {
		return toDTO(pageDao.findById(id));
	}

	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> findAllPages() {
		return toDTOs(pageDao.findAllPages(), false);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> findRootTreeView() {
		return toDTOs(pageDao.findRootTreeView(), true);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> getTreePages() {
		List<PageDTO> dtos = new ArrayList<PageDTO>();
		List<Page> list = pageDao.findRootPages();
		if( list != null && list.size() > 0){
			dtos = toDTOs( list, true );
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> getSelectionPages() {
		return getSelectionPages(getTreePages(), -1, 1);
	}

	@Override
	@Transactional(readOnly = true)
	public List<PageDTO> getSelectionPages(List<PageDTO> treePages, int exceptIdAndChildren, int level) {
		List<PageDTO> pages = new ArrayList<PageDTO>();
		if( treePages != null && treePages.size() > 0 ){
			for( PageDTO dto : treePages ){
				if( dto.getId() != exceptIdAndChildren ){
					String prefixName = "";
					for(int i = 1; i < level; i ++){
						prefixName += "---";
					}
					dto.setName(prefixName + dto.getName());
					pages.add(dto);
				}
			}
		}
		return pages;
	}

	@Override
	@Transactional
	public PageDTO savePage(PageDTO dto) {
		return toDTO(pageDao.savePage(toEntite(dto)));
	}

	@Override
	@Transactional
	public PageDTO deletePage(int id) {
		return toDTO(pageDao.deletePage(id));
	}

	@Override
	@Transactional
	public void update(Page page) {
		pageDao.update(page);
	}

	@Override
	@Transactional
	public void remove(int id) {
		 pageDao.remove(pageDao.find(id));
	}
	
	@Override
	public PageDTO getByFriendURL(String friendURL) {
		return toDTO( pageDao.findByFriendURL(friendURL) );
	}
	
	@Override
	public long countByFriendUrlExceptPageId(String friendURL, int pageId) {
		return pageDao.countByFriendUrlExceptPageId(friendURL, pageId);
	}
}
