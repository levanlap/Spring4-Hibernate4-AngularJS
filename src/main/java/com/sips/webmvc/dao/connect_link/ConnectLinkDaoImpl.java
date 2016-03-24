package com.sips.webmvc.dao.connect_link;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.connect_link.ConnectLink;
import com.sips.webmvc.model.connect_link.ConnectLinkTypeEnum;

@Repository
public class ConnectLinkDaoImpl extends GenericDaoImpl<ConnectLink, Integer> implements
		ConnectLinkDao {

	public ConnectLinkDaoImpl() {
		setClazz(ConnectLink.class);
	}
	
	@Override
	public ConnectLink findById(int id) {
		return (ConnectLink) currentSession().get(ConnectLink.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ConnectLink> findAllPartners() {
		List<ConnectLink> partners = (List<ConnectLink>) currentSession()
				.createQuery("from ConnectLink where type = :type").setParameter("type", ConnectLinkTypeEnum.PARNER.toString()).list();
		return partners;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ConnectLink> findByType(String type) {
		List<ConnectLink> partners = (List<ConnectLink>) currentSession()
				.createQuery("from ConnectLink where type = :type order by sortOrder").setParameter("type", type).list();
		return partners;
	}



	@Override
	public ConnectLink savePartner(ConnectLink partner) {
		if(partner.getId() != null){
			return (ConnectLink) currentSession().merge(partner);
		}
		currentSession().persist(partner);
		return partner;
		
	}

	@Override
	public ConnectLink deletePartner(int id) {
		ConnectLink partner = (ConnectLink) currentSession().get(ConnectLink.class, id);
		currentSession().delete(partner);
		return partner;
	}
	
}