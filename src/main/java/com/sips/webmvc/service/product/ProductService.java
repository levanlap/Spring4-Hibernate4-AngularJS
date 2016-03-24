package com.sips.webmvc.service.product;

import java.util.List;

import com.sips.webmvc.dto.product.ProductDTO;
import com.sips.webmvc.model.product.Product;


public interface ProductService {
	
	Product toEntity(ProductDTO dto);
	
	ProductDTO toDTO(Product entity);
	
	List<ProductDTO> toDTOs(List<Product> entities);
	
	List<ProductDTO> toDTOsFromBestSellers(List<Object[]> objects);

	List<ProductDTO> getAllByAdmin();
	
	List<ProductDTO> getByAll(int firstResult, int maxResults);
	
	List<ProductDTO> getByCatalogFriendURL(String catalogFriendURL,  int firstResult, int maxResults);
	
	List<ProductDTO> getByBestSellers(int firstResult, int maxResults);
	
	List<ProductDTO> getByBestSellersByCatalogFriendURL(
			String catalogFriendURL, int firstResult, int maxResults);
	
	List<ProductDTO> getByBestSellersByCatalogIdAndItsChildren(int catalogId, int firstResult,
			int maxResults);

	List<ProductDTO> getByDiscounts(int firstResult, int maxResults);
	
	List<ProductDTO> getByStatus(int firstResult, int maxResults, String status);

	List<ProductDTO> getFilterByPrice(int priceFilter, int i, int maxResults);

	List<ProductDTO> getByCatalogFriendURLAndFilterByPrice(
	String catalogFriendURL, int priceFilter, int i, int maxResults);

	List<ProductDTO> getSearchTextAndFilterByPrice(String searchText,
	int priceFilter, int i, int maxResults);

	long countByAll();
	
	long countByCatalogFriendURL(String catalogFriendURL);
	
	long countByCatalogId(int catalogId);
	
	long countByFriendUrl(String friendUrl);
	
	long countByFriendUrlExceptProductId(String friendUrl, int productId);

	ProductDTO getById(int id);
	
	ProductDTO getByFriendUrl(String friendUrl);
	
	long countByCatalogFriendURLAndFilterByPrice(String catalogFriendURL,
			int priceFilter);

	long countFilterByPrice(int priceFilter);

	long countBySearchTextAndFilterByPrice(String searchText, int priceFilter);

	ProductDTO saveProduct(ProductDTO product);

	ProductDTO deleteById(int id);

	boolean canDeleteByProductId(int id);
	
	boolean isExisted(ProductDTO product);

}
