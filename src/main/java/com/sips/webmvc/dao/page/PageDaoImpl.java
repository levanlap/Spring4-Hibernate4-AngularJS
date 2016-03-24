package com.sips.webmvc.dao.page;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.page.Page;

@Repository
public class PageDaoImpl extends GenericDaoImpl<Page, Integer> implements
		PageDao {

	public PageDaoImpl() {
		setClazz(Page.class);
	}
	
	@Override
	public Page findById(int id) {
		return (Page) currentSession().get(Page.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Page> findAllPages() {
		List<Page> pages = (List<Page>) currentSession().createQuery("from Page c order by c.name").list();
		return pages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Page> findRootTreeView() {
		List<Page> pages = (List<Page>) currentSession().createQuery(
				"from Page").list();
		return pages;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Page> findRootPages() {
		String hql = "from Page c order by c.sortOrder";
		List<Page> pages = (List<Page>) currentSession().createQuery(
				hql).list();
		return pages;
	}

	@Override
	public Page savePage(Page page) {
		if(page.getId() != null){
			return (Page) currentSession().merge(page);
		}
		currentSession().persist(page);
		return page;
		
	}

	@Override
	public Page deletePage(int id) {
		Page page = (Page) currentSession().get(Page.class, id);
		currentSession().delete(page);
		return page;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Page findByFriendURL(String friendURL) {
		String hql = "from Page c where c.friendURL = :friendURL";
		List<Page> pages = (List<Page>) currentSession()
				.createQuery(hql).setParameter("friendURL", friendURL).list();
		if( pages.size() > 0 ){
			return pages.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrlExceptPageId(String friendURL, int pageId) {
		String hql = "select count(o.id) from Page o where o.friendURL = :friendURL";
		if(pageId > 0){
			hql += " and o.id != :pageId";
		}
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("friendURL", friendURL);
		if(pageId > 0){
			query.setParameter("pageId", pageId);
		}
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}
}