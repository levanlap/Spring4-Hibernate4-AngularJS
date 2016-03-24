package com.sips.webmvc.dao.connect_link;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.connect_link.ConnectLink;

public interface ConnectLinkDao extends GenericDao<ConnectLink, Integer> {

	ConnectLink findById(int id);

	List<ConnectLink> findAllPartners();

	ConnectLink savePartner(ConnectLink partner);

	ConnectLink deletePartner(int id);

	List<ConnectLink> findByType(String type);

}