package com.sips.webmvc.dao.generic;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
public class GenericDaoImpl<E, K extends Serializable> implements GenericDao<E, K> {
	private Class< E > clazz;
	public void setClazz( final Class< E > clazzToSet ){
	      clazz = clazzToSet;
	   }
	@Autowired
	private SessionFactory sessionFactory;
	protected Class<? extends E> daoType;

	public GenericDaoImpl() {
		daoType = (Class<E>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List< E > findAll(){
		return sessionFactory.getCurrentSession().createQuery( "from " + clazz.getName() ).list();
	   }

	@Override
	public void add(E entity) {
		currentSession().save(entity);
	}

	@Override
	public void update(E entity) {
		currentSession().saveOrUpdate(entity);
	}

	@Override
	public void remove(E entity) {
		currentSession().delete(entity);
	}

	@Override
	public E find(K key) {
		return (E) currentSession().get(daoType, key);
	}

	@Override
	public List<E> list() {
		return currentSession().createCriteria(daoType).list();
	}
	
	public String createHqlWithPrices(String hql, int priceFilter){
		if(priceFilter > 1){
			hql += " and (o.smallPrice > :priceFilter or o.mediumPrice > :priceFilter or o.largePrice > :priceFilter)";
		}
		else if(priceFilter == 0){
			// Go down
			hql += " order by o.smallPrice,o.mediumPrice,o.largePrice desc";
		}else if(priceFilter == 1){
			// Go up
			hql += " order by o.smallPrice,o.mediumPrice,o.largePrice asc";
		}
		return hql;
	}
	
	public String createHqlCountWithPrices(String hql, int priceFilter){
		if(priceFilter > 1){
			hql += " and (o.smallPrice > :priceFilter or o.mediumPrice > :priceFilter or o.largePrice > :priceFilter)";
		}
		return hql;
	}
	
	public Query createQueryWithLimitResults(String hql, int firstResult, int maxResults){
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return query;
	}
}