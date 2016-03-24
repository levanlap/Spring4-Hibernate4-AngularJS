package com.sips.webmvc.dao.product;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.product.Product;

public interface ProductDao extends GenericDao<Product, Integer>{

	Product findById(int id);
	
	Product findByFriendUrl(String friendUrl);
	
	List<Product> findAllByAdmin();
	
	List<Product> findByAll(int firstResult, int maxResults);
	
	List<Product> findByCatalogFriendURL(String catalogFriendURL, int firstResult, int maxResults);
	
	List<Product> findByDiscounts(int firstResult, int maxResults);
	
	List<Product> findByStatus(int firstResult, int maxResults, String status);

	List<Object[]> findByBestSellers(int firstResult, int maxResults);

	List<Object[]> findByBestSellersByCatalogFriendURL(String catalogFriendURL,
			int firstResult, int maxResults);
	
	List<Object[]> findByBestSellersByCatalogIdAndItsChildren(
			int catalogId,
			int firstResult,
			int maxResults);

	List<Product> findFilterByPrice(int priceFilter, int firstResult,
	int maxResults);

	List<Product> findByCatalogFriendURLAndFilterByPrice(
	String catalogFriendURL, int priceFilter, int firstResult,
	int maxResults);

	List<Product> findBySearchTextAndFilterByPrice(String searchText,
	int priceFilter, int firstResult, int maxResults);

	long countByAll();
	
	long countByCatalogId(int catalogId);
	
	long countByFriendUrl(String friendUrl);

	long countByFriendUrlExceptProductId(String friendUrl, int productId);
	
	long countProductAtOrder(int id);

	long countByCatalogFriendURLAndFilterByPrice(String catalogFriendURL,
			int priceFilter);

	long countFilterByPrice(int priceFilter);

	long countBySearchTextAndFilterByPrice(String searchText, int priceFilter);
	
	long countByProductNameAndCatalogId(String productName, String catalogId);

	Product saveProduct(Product product);

	Product deleteById(int id);

}