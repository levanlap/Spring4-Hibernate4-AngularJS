package com.sips.webmvc.service.connect_link;

import java.util.List;

import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.model.connect_link.ConnectLink;

public interface ConnectLinkService {

	ConnectLink toEntite(ConnectLinkDTO dto);

	ConnectLinkDTO toDTO(ConnectLink entity);

	ConnectLinkDTO findById(int id);

	List<ConnectLinkDTO> toDTOs(List<ConnectLink> partner);

	List<ConnectLinkDTO> findAllPartners();

	void remove(int id);

	void update(ConnectLinkDTO dto);

	List<ConnectLinkDTO> findByType(String type);

	
}
