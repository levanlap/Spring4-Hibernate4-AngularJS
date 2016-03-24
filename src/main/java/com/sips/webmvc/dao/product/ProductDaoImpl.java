package com.sips.webmvc.dao.product;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.catalog.CatalogDao;
import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.catalog.Catalog;
import com.sips.webmvc.model.product.Product;
import com.sips.webmvc.model.product.ProductStatusEnum;

@Repository
public class ProductDaoImpl extends GenericDaoImpl<Product, Integer> implements ProductDao {
	
	@Autowired
	private CatalogDao catalogDao;

	@Override
	public Product findById(int id) {
		return (Product) currentSession().get(Product.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Product findByFriendUrl(String friendUrl) {
		String hql = "from Product o "
				+ " where o.friendURL = :friendUrl "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		List<Product> products = (List<Product>) currentSession().createQuery(hql).setParameter("friendUrl", friendUrl).list();
		if(products != null && products.size() > 0){
			return products.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findAllByAdmin() {
		String hql = "from Product o ";
		Query query = currentSession().createQuery(hql);
		return (List<Product>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByAll(int firstResult, int maxResults) {
		String hql = "from Product o "
				+ "	where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		Query query = currentSession().createQuery(hql);
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Product>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByCatalogFriendURL(String catalogFriendURL, int firstResult, int maxResults) {
		
		Catalog catalog = catalogDao.findByFriendURL(catalogFriendURL);
		
		String hql = "from Product o "
				+ " where o.catalogIds like :catalogId "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		Query query = currentSession().createQuery(hql);
		query.setParameter("catalogId", "%," + catalog.getId() + "%");
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Product>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByDiscounts(int firstResult, int maxResults) {
		String hql = "from Product o "
				+ " where (o.discountSmallPrice != null or o.discountMediumPrice != null or o.discountLargePrice != null) "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		Query query = currentSession().createQuery(hql);
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByStatus(int firstResult, int maxResults,
			String status) {
		String hql = "from Product o "
				+ " where o.status = '" + status +"'";
		Query query = currentSession().createQuery(hql);
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findByBestSellers(int firstResult, int maxResults) {
		String hql = "select count(o.product.id) as bestsallers, o.product "
				+ " from Order o "
				+ " where o.product.status != '" + ProductStatusEnum.DISABLED.name() +"'"
				+ " group by o.product order by bestsallers desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findByBestSellersByCatalogFriendURL(
			String catalogFriendURL, int firstResult, int maxResults) {
		/*String hql = "select c.id from Catalog c "
				+ " where c.friendURL = :catalogFriendURL ";
		List<Integer> catalogIds = (List<Integer>) currentSession()
				.createQuery(hql).setParameter("catalogFriendURL", catalogFriendURL).list();*/
		
		Catalog catalog = catalogDao.findByFriendURL(catalogFriendURL);
		
		String hql = "select count(o.product.id) as bestsallers, o.product "
				+ " from Order o "
				+ " where o.product.catalogIds like :catalogId "
				+ " and  o.status != '" + ProductStatusEnum.DISABLED.name() +"'"
				+ " group by o.product "
				+ " order by bestsallers desc";
		Query query = currentSession().createQuery(hql);
		query.setParameter("catalogId", "%,"+catalog.getId()+"%");
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findByBestSellersByCatalogIdAndItsChildren(
			int catalogId,
			int firstResult,
			int maxResults) {
		/*String hql = "select c.id from Catalog c where c.parentId = :parentId";
		List<Integer> catalogIds = (List<Integer>) currentSession()
				.createQuery(hql).setParameter("parentId", catalogId).list();
		catalogIds.add(catalogId);*/
		
		
		String hql = "select count(o.product.id) as bestsallers, o.product "
				+ " from Order o "
				+ " where o.product.catalogIds like :catalogId "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'"
				+ " group by o.product "
				+ " order by bestsallers desc";
		Query query = currentSession().createQuery(hql);
		query.setParameter("catalogId", "%,"+catalogId+"%");
		if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findFilterByPrice(int priceFilter, int firstResult,
			int maxResults) {
		String hql = "from Product o "
				+ "	where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}
		else if(priceFilter == 0){
			// Go down
			hql += " order by o.price desc";
		}else if(priceFilter == 1){
			// Go up
			hql += " order by o.price asc";
		}*/
		hql= createHqlWithPrices(hql, priceFilter);
		
		//Query query = currentSession().createQuery(hql);
		Query query = createQueryWithLimitResults(hql, firstResult, maxResults);
		
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		/*if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}*/
		
		return (List<Product>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findByCatalogFriendURLAndFilterByPrice(
			String catalogFriendURL, int priceFilter, int firstResult,
			int maxResults) {
		
		Catalog catalog = catalogDao.findByFriendURL(catalogFriendURL);
		
		String hql = "from Product o "
				+ " where o.catalogIds like :catalogId "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}
		else if(priceFilter == 0){
			// Go down
			hql += " order by o.price desc";
		}else if(priceFilter == 1){
			// Go up
			hql += " order by o.price asc";
		}*/
		hql= createHqlWithPrices(hql, priceFilter);
		
		//Query query = currentSession().createQuery(hql);
		Query query = createQueryWithLimitResults(hql, firstResult, maxResults);
		
		query.setParameter("catalogId", "%,"+catalog.getId()+"%");
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		
		/*if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}*/
		
		return (List<Product>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findBySearchTextAndFilterByPrice(String searchText,
			int priceFilter, int firstResult, int maxResults) {
		String hql = "from Product o "
				+ "	where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		
		
		if(searchText != null && !searchText.isEmpty()){
			hql += " and o.name like :searchText";
		}
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}
		else if(priceFilter == 0){
			// Go down
			hql += " order by o.price desc";
		}else if(priceFilter == 1){
			// Go up
			hql += " order by o.price asc";
		}*/
		hql= createHqlWithPrices(hql, priceFilter);
		
		//Query query = currentSession().createQuery(hql);
		Query query = createQueryWithLimitResults(hql, firstResult, maxResults);
		
		if(searchText != null && !searchText.isEmpty()){
			query.setParameter("searchText", "%" + searchText + "%");
		}
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		/*if(firstResult < -0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}*/
		
		return (List<Product>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByAll() {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ " where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByCatalogId(int catalogId){
		String hql = "select count(o.id) "
				+ " from Product o where o.catalogIds like :catalogId "
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("catalogId", "%,"+catalogId+"%").list();
		return counts.get(0).longValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrl(String friendUrl) {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ " where o.friendURL = :friendURL"
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("friendURL", friendUrl).list();
		return counts.get(0).longValue();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrlExceptProductId(String friendUrl, int productId) {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ " where o.friendURL = :friendURL"
				+ " and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		if(productId > 0){
			hql += " and o.id != :productId";
		}
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("friendURL", friendUrl);
		if(productId > 0){
			query.setParameter("productId", productId);
		}
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countProductAtOrder(int id) {
		String hql = "select count(o.product.id) "
				+ " from Order o "
				+ " where o.product.id = :productId";
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("productId", id);
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countFilterByPrice(int priceFilter) {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ " where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}*/
		hql = createHqlCountWithPrices(hql, priceFilter);
		
		Query query = currentSession().createQuery(hql);
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByCatalogFriendURLAndFilterByPrice(
			String catalogFriendURL, int priceFilter) {
		
		Catalog catalog = catalogDao.findByFriendURL(catalogFriendURL);
		
		String hql = "select count(o.id) "
				+ " from Product o "
				+ "	where o.catalogIds = :catalogId"
				+ "	and o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}*/
		hql = createHqlCountWithPrices(hql, priceFilter);
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("catalogId", "%," + catalog.getId() + "%");
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countBySearchTextAndFilterByPrice(String searchText,
			int priceFilter) {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ " where o.status != '" + ProductStatusEnum.DISABLED.name() +"'";
		if(searchText != null && !searchText.isEmpty()){
			hql += " and o.name like :searchText";
		}
		/*if(priceFilter > 1){
			hql += " and o.price > :priceFilter";
		}*/
		hql = createHqlCountWithPrices(hql, priceFilter);
		
		Query query = currentSession().createQuery(hql);

		if(searchText != null && !searchText.isEmpty()){
			query.setParameter("searchText", "%" + searchText + "%");
		}
		if(priceFilter > 1){
			query.setParameter("priceFilter", (double)priceFilter);
		}
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByProductNameAndCatalogId(String productName,
			String catalogId) {
		String hql = "select count(o.id) "
				+ " from Product o "
				+ "	where o.name = :productName"
				+ "	and o.catalogIds like :catalogId";
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("productName", productName);
		query.setParameter("catalogId", "%," + catalogId + "%");
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@Override
	public Product saveProduct(Product product) {
		if(product.getId() != null){
			return (Product) currentSession().merge(product);
		}
		product.setCreatedDate(new Date());
		currentSession().persist(product);
		return product;
	}

	@Override
	public Product deleteById(int id) {
		Product product = (Product) currentSession().get(Product.class, id);
		currentSession().delete(product);
		return product;
	}
}