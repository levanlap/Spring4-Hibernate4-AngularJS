package com.sips.webmvc.service.catalog;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.catalog.CatalogDao;
import com.sips.webmvc.dao.product.ProductDao;
import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.model.catalog.Catalog;

@Service
public class CatalogServiceImpl implements CatalogService {

	@Autowired
	private CatalogDao catalogDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public CatalogDTO toDTO(Catalog catalog) {
		if(catalog == null){
			return null;
		}
		CatalogDTO dto = new CatalogDTO();
		dto.setId(catalog.getId());
		dto.setName(catalog.getName());
		dto.setFriendURL(catalog.getFriendURL());
		dto.setParentId(catalog.getParentId());
		dto.setSortOrder(catalog.getSortOrder());
		dto.setCountChildren(productDao.countByCatalogId(catalog.getId()));
		return dto;
	}
	
	@Override
	public Catalog toEntite(CatalogDTO dto) {
		Catalog catalog = new Catalog();
		catalog.setId(dto.getId());
		catalog.setName(dto.getName());
		catalog.setFriendURL(dto.getFriendURL());
		catalog.setParentId(dto.getParentId());
		catalog.setSortOrder(dto.getSortOrder());
		return catalog;
	}

	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> toDTOs(List<Catalog> catalogs, boolean isCopyChildren) {
		List<CatalogDTO> dtos = new ArrayList<CatalogDTO>();
		if( catalogs != null && catalogs.size() > 0){
			for( Catalog c : catalogs ){
				CatalogDTO dto = toDTO(c);
				if(isCopyChildren){
					dto.setChildren( toDTOs(catalogDao.findAllByParentId(c.getId()), true) );
				}
				dtos.add(dto);
			}
		}
		return dtos;
	}

	@Override
	@Transactional(readOnly = true)
	public CatalogDTO findById(int id) {
		return toDTO(catalogDao.findById(id));
	}

	@Override
	public List<CatalogDTO> findByIds(String ids) {
		return toDTOs(catalogDao.findByIds(ids), false);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> findAllCatalogs() {
		return toDTOs(catalogDao.findAllCatalogs(), false);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> findRootTreeView() {
		return toDTOs(catalogDao.findRootTreeView(), true);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> getTreeCatalogs() {
		List<CatalogDTO> dtos = new ArrayList<CatalogDTO>();
		List<Catalog> list = catalogDao.findRootCatalogs();
		if( list != null && list.size() > 0){
			dtos = toDTOs( list, true );
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> getSelectionCatalogs() {
		return getSelectionCatalogs(getTreeCatalogs(), -1, 1);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CatalogDTO> getSelectionCatalogs(List<CatalogDTO> treeCatalogs, int exceptIdAndChildren, int level) {
		List<CatalogDTO> catalogs = new ArrayList<CatalogDTO>();
		if( treeCatalogs != null && treeCatalogs.size() > 0 ){
			for( CatalogDTO dto : treeCatalogs ){
				if( dto.getId() != exceptIdAndChildren ){
					String prefixName = "";
					for(int i = 1; i < level; i ++){
						prefixName += "---";
					}
					dto.setName(prefixName + dto.getName());
					catalogs.add(dto);
					if(dto.getChildren().size() > 0){
						int increase = level + 1;
						catalogs.addAll( getSelectionCatalogs(dto.getChildren(), exceptIdAndChildren, increase) );
					}
				}
			}
		}
		return catalogs;
	}

	@Override
	@Transactional
	public CatalogDTO saveCatalog(CatalogDTO dto) {
		return toDTO(catalogDao.saveCatalog(toEntite(dto)));
	}

	@Override
	@Transactional
	public CatalogDTO deleteCatalog(int id) {
		return toDTO(catalogDao.deleteCatalog(id));
	}

	@Override
	@Transactional
	public void update(Catalog catalog) {
		catalogDao.update(catalog);
	}

	@Override
	@Transactional
	public void remove(int id) {
		 catalogDao.remove(catalogDao.find(id));
	}
	
	@Override
	public CatalogDTO getByFriendURL(String friendURL) {
		return toDTO( catalogDao.findByFriendURL(friendURL) );
	}
	
	@Override
	public CatalogDTO getParentByFriendURL(String friendURL) {
		return toDTO( catalogDao.findParentByFriendURL(friendURL) );
	}
	
	@Override
	public boolean canDeleteById(int id) {
		long count  = catalogDao.countByParentId(id);
		if(count == 0){
			count = productDao.countByCatalogId(id);
		}
		return count == 0;
	}

	@Override
	@Transactional(readOnly = true)
	public long countByFriendUrl(String friendURL) {
		return catalogDao.countByFriendUrl(friendURL);
	}

	@Override
	public long countByFriendUrlExceptProductId(String friendURL, int catalogId) {
		return catalogDao.countByFriendUrlExceptProductId(friendURL, catalogId);
	}

}
