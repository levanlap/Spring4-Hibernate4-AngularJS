package com.sips.webmvc.service.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.controller.backend.ImageController;
import com.sips.webmvc.dao.catalog.CatalogDao;
import com.sips.webmvc.dao.product.ProductDao;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.dto.product.ProductDTO;
import com.sips.webmvc.model.catalog.Catalog;
import com.sips.webmvc.model.product.Product;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.service.image.ImageService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	private static Logger LOG = Logger.getLogger(ProductServiceImpl.class);

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CatalogDao catalogDao;
	
	@Autowired
	private CatalogService catalogService;
	
	@Autowired
	private ImageService imageService;
	
	@Override
	public Product toEntity(ProductDTO dto) {
		if(dto == null){
			return null;
		}
		Product entity = new Product();
		entity.setId(dto.getId());
		entity.setContent(dto.getContent());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setName(dto.getName());
		entity.setFriendURL(dto.getFriendURL());
		entity.setSmallPrice(dto.getSmallPrice());
		entity.setMediumPrice(dto.getMediumPrice());
		entity.setLargePrice(dto.getLargePrice());
		entity.setDiscountSmallPrice(dto.getDiscountSmallPrice());
		entity.setDiscountMediumPrice(dto.getDiscountMediumPrice());
		entity.setDiscountLargePrice(dto.getDiscountLargePrice());
		entity.setView(dto.getView());
		entity.setStatus(dto.getStatus());
		entity.setOrderNote(dto.getOrderNote());
		entity.setDetailNote(dto.getDetailNote());
		entity.setCode(dto.getCode());
		entity.setCatalogIds(dto.getCatalogIds());
		
		if(dto.getImageLink() != null && dto.getImageLink().getId() != null){
			entity.setImageLink(dto.getImageLink().getId().toString());
		}
		if(dto.getImageList() != null){
			String ids = "";
			for(ImageDTO imageDTO : dto.getImageList()){
				ids += imageDTO.getId() + ",";
			}
			entity.setImageList(ids);
		}else{
			entity.setImageList("");
		}
		return entity;
	}
	
	@Override
	public ProductDTO toDTO(Product entity) {
		if(entity == null){
			return null;
		}
		ProductDTO dto = new ProductDTO();
		dto.setId(entity.getId());
		dto.setContent(entity.getContent());
		dto.setCreatedDate(entity.getCreatedDate());
		if(entity.getImageLink() != null){
			dto.setImageLink(imageService.getById(Integer.parseInt(entity.getImageLink())));
		}
		dto.setImageList(imageService.getByIds(entity.getImageList()));
		dto.setName(entity.getName());
		dto.setOldName(entity.getName());
		dto.setFriendURL(entity.getFriendURL());
		dto.setFriendURL(entity.getFriendURL());
		dto.setSmallPrice(entity.getSmallPrice());
		dto.setMediumPrice(entity.getMediumPrice());
		dto.setLargePrice(entity.getLargePrice());
		dto.setDiscountSmallPrice(entity.getDiscountSmallPrice());
		dto.setDiscountMediumPrice(entity.getDiscountMediumPrice());
		dto.setDiscountLargePrice(entity.getDiscountLargePrice());
		dto.setView(entity.getView());
		dto.setStatus(entity.getStatus());
		dto.setCatalogIds(entity.getCatalogIds());
		dto.setOldCatalogIds(entity.getCatalogIds());
		dto.setCatalogs(catalogService.findByIds(entity.getCatalogIds()));
		dto.setOrderNote(entity.getOrderNote());
		dto.setDetailNote(entity.getDetailNote());
		dto.setCode(entity.getCode());
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> toDTOs(List<Product> entities) {
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		if( entities != null && entities.size() > 0){
			for( Product e : entities ){
				ProductDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> toDTOsFromBestSellers(List<Object[]> objects) {
		List<ProductDTO> dtos = new ArrayList<ProductDTO>();
		if( objects != null && objects.size() > 0){
			for( Object[] o : objects ){
				ProductDTO dto = toDTO((Product)o[1]);
				dto.setBestSellers(Integer.parseInt(String.valueOf(o[0])));
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getAllByAdmin() {
		return toDTOs(productDao.findAllByAdmin());
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByAll(int firstResult, int maxResults) {
		return toDTOs(productDao.findByAll(firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByCatalogFriendURL(String catalogFriendURL, int firstResult, int maxResults) {
		return toDTOs(productDao.findByCatalogFriendURL(catalogFriendURL, firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByBestSellers(int firstResult, int maxResults) {
		return toDTOsFromBestSellers(productDao.findByBestSellers(firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByBestSellersByCatalogFriendURL(
			String catalogFriendURL, int firstResult, int maxResults) {
		return toDTOsFromBestSellers(productDao.findByBestSellersByCatalogFriendURL(catalogFriendURL, firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByBestSellersByCatalogIdAndItsChildren(int catalogId, int firstResult, int maxResults) {
		return toDTOsFromBestSellers(productDao.findByBestSellersByCatalogIdAndItsChildren(catalogId, firstResult, maxResults));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByDiscounts(int firstResult, int maxResults) {
		return toDTOs(productDao.findByDiscounts(firstResult, maxResults));
	}
	
	@Override
	public List<ProductDTO> getByStatus(int firstResult, int maxResults, String status) {
		return toDTOs(productDao.findByStatus(firstResult, maxResults, status));
	}

	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getFilterByPrice(int priceFilter, int firstResult,
			int maxResults) {
		return toDTOs( productDao.findFilterByPrice(priceFilter, firstResult, maxResults) );
	}

	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getByCatalogFriendURLAndFilterByPrice(
			String catalogFriendURL, int priceFilter, int firstResult, int maxResults) {
		return toDTOs( productDao.findByCatalogFriendURLAndFilterByPrice(catalogFriendURL, priceFilter, firstResult, maxResults) );
	}

	@Override
	@Transactional(readOnly = true)
	public List<ProductDTO> getSearchTextAndFilterByPrice(String searchText,
			int priceFilter, int firstResult, int maxResults) {
		return toDTOs( productDao.findBySearchTextAndFilterByPrice(searchText, priceFilter, firstResult, maxResults) );
	}

	@Override
	@Transactional(readOnly = true)
	public long countByAll() {
		return productDao.countByAll();
	}

	@Override
	@Transactional(readOnly = true)
	public long countByCatalogFriendURL(String catalogFriendURL) {
		Catalog catalog = catalogDao.findByFriendURL(catalogFriendURL);
		return productDao.countByCatalogId(catalog.getId());
	}
	
	@Override
	@Transactional(readOnly = true)
	public long countByCatalogId(int catalogId) {
		return productDao.countByCatalogId(catalogId);
	}
	
	@Override
	@Transactional(readOnly = true)
	public long countByFriendUrl(String friendUrl) {
		return productDao.countByFriendUrl(friendUrl);
	}
	
	@Override
	@Transactional(readOnly = true)
	public long countByFriendUrlExceptProductId(String friendUrl, int productId) {
		return productDao.countByFriendUrlExceptProductId(friendUrl, productId);
	}

	@Override
	@Transactional(readOnly = true)
	public ProductDTO getById(int id) {
		return toDTO( productDao.findById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public ProductDTO getByFriendUrl(String friendUrl) {
		return toDTO( productDao.findByFriendUrl(friendUrl) );
	}

	@Override
	@Transactional(readOnly = true)
	public long countByCatalogFriendURLAndFilterByPrice(
			String catalogFriendURL, int priceFilter) {
		return productDao.countByCatalogFriendURLAndFilterByPrice(catalogFriendURL, priceFilter);
	}

	@Override
	@Transactional(readOnly = true)
	public long countFilterByPrice(int priceFilter) {
		return productDao.countFilterByPrice(priceFilter);
	}

	@Override
	@Transactional(readOnly = true)
	public long countBySearchTextAndFilterByPrice(String searchText,
			int priceFilter) {
		return productDao.countBySearchTextAndFilterByPrice(searchText, priceFilter);
	}

	@Override
	public ProductDTO saveProduct(ProductDTO product) {
		return toDTO( productDao.saveProduct(toEntity(product)) );
	}

	@Override
	public ProductDTO deleteById(int id) {
		return toDTO( productDao.deleteById(id) );
	}

	@Override
	public boolean canDeleteByProductId(int id) {
		return (productDao.countProductAtOrder(id) == 0);
	}

	@Override
	public boolean isExisted(ProductDTO product) {
		
		boolean existed = false;
		
		if(product.getCatalogIds() != null){
			
			LOG.debug("getCatalogIds: "+product.getCatalogIds());

			for(String catalogId : product.getCatalogIds().split(",")){
				
				if(catalogId != null && !catalogId.isEmpty()){
					long count = productDao.countByProductNameAndCatalogId(product.getName().trim(), catalogId);
					
					LOG.debug(catalogId + " count:" + count);
					
					if(count > 0){
						/* In case create new */
						if( product.getId() == null ){
							
							LOG.debug("id is null");
							
							existed = true;
							break;
						}
						
						/* In case update */
						else{
							
							LOG.debug("id not null");
							
							/* In case the name is changed */
							if( !product.getName().trim().equalsIgnoreCase(product.getOldName().trim()) ){
								
								LOG.debug("change name");
								
								existed = true;
								break;
							}else{
								
								LOG.debug("not change name");
								
								/* In case the name is not changed then check with catalog*/
								if( product.getOldCatalogIds() != null ){
									
									/* In this case the name has existed in other catalog */
									if( !product.getOldCatalogIds().contains("," + catalogId) ){
										
										LOG.debug("existed in other catalog");
										
										existed = true;
										break;
									}
								}
							}
						}
					}
				}
			}
			
		}
		
		LOG.debug("existed : " + existed);
		
		return existed;
	}

}
