package com.sips.webmvc.dao.catalog;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.catalog.Catalog;

@Repository
public class CatalogDaoImpl extends GenericDaoImpl<Catalog, Integer> implements
		CatalogDao {

	public CatalogDaoImpl() {
		setClazz(Catalog.class);
	}
	
	@Override
	public Catalog findById(int id) {
		return (Catalog) currentSession().get(Catalog.class, id);
	}

	@Override
	public List<Catalog> findByIds(String ids) {
		List<Catalog> catalogs = new ArrayList<Catalog>();
		if( ids != null && !ids.isEmpty()){
			for(String id : ids.split(",")){
				if(id != null && !id.isEmpty()){
					catalogs.add( findById(Integer.parseInt(id)) );
				}
			}
		}
		return catalogs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Catalog> findAllCatalogs() {
		List<Catalog> catalogs = (List<Catalog>) currentSession().createQuery("from Catalog order by ").list();
		return catalogs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Catalog> findRootTreeView() {
		List<Catalog> catalogs = (List<Catalog>) currentSession().createQuery(
				"from Catalog where parentId = 0").list();
		return catalogs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Catalog> findRootCatalogs() {
		String hql = "from Catalog c where c.parentId = 0 order by c.sortOrder";
		List<Catalog> catalogs = (List<Catalog>) currentSession().createQuery(
				hql).list();
		return catalogs;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Catalog> findAllByParentId(int parentId) {
		String hql = "from Catalog c where c.parentId = :parentId order by c.sortOrder";
		List<Catalog> catalogs = (List<Catalog>) currentSession()
				.createQuery(hql).setParameter("parentId", parentId).list();
		return catalogs;
	}
	
	@Override
	public Catalog saveCatalog(Catalog catalog) {
		if(catalog.getId() != null){
			return (Catalog) currentSession().merge(catalog);
		}
		currentSession().persist(catalog);
		return catalog;
		
	}

	@Override
	public Catalog deleteCatalog(int id) {
		Catalog catalog = (Catalog) currentSession().get(Catalog.class, id);
		currentSession().delete(catalog);
		return catalog;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Catalog findByFriendURL(String friendURL) {
		String hql = "from Catalog c where c.friendURL = :friendURL";
		List<Catalog> catalogs = (List<Catalog>) currentSession()
				.createQuery(hql).setParameter("friendURL", friendURL).list();
		if( catalogs.size() > 0 ){
			return catalogs.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Catalog findParentByFriendURL(String friendURL) {
		String hql = "from Catalog c where c.friendURL = :friendURL";
		List<Catalog> catalogs = (List<Catalog>) currentSession()
				.createQuery(hql).setParameter("friendURL", friendURL).list();
		if( catalogs.size() > 0 ){
			if(catalogs.get(0).getParentId() != null){
				return findById(catalogs.get(0).getParentId());
			}
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countByParentId(int parentId){
		String hql = "select count(o.id) from Catalog o where o.parentId = :parentId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("parentId", parentId).list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrl(String friendURL) {
		String hql = "select count(o.id) from Catalog o where o.friendURL = :friendURL";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("friendURL", friendURL).list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrlExceptProductId(String friendURL, int catalogId) {
		String hql = "select count(o.id) from Catalog o where o.friendURL = :friendURL";
		if(catalogId > 0){
			hql += " and o.id != :catalogId";
		}
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("friendURL", friendURL);
		if(catalogId > 0){
			query.setParameter("catalogId", catalogId);
		}
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}

}