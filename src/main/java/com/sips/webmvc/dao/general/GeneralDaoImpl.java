package com.sips.webmvc.dao.general;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.general.General;

@Repository
public class GeneralDaoImpl extends GenericDaoImpl<General, Integer>
		implements GeneralDao {

	public GeneralDaoImpl() {
		setClazz(General.class);
	}
	
	@Override
	public General findSetting() {
		String hql = "from General g ";
		Query query = currentSession().createQuery(hql);
		return (General)query.list().get(0);
	}

	@Override
	public General saveGeneral(General entity) {
		// TODO Auto-generated method stub
		if(entity.getId() != null){
			return (General) currentSession().merge(entity);
		}
		currentSession().persist(entity);
		return entity;
	}



}