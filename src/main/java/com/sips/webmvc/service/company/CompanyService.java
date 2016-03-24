package com.sips.webmvc.service.company;

import java.util.List;

import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.model.company.Company;

public interface CompanyService {
	
	Company toEntity(CompanyDTO dto);
	
	CompanyDTO toDTO(Company entity);
	
	List<CompanyDTO> toDTOs(List<Company> entities);

	CompanyDTO getById(int id);
	
	List<CompanyDTO> getByAll();
	
	List<CompanyDTO> getByAll(int firstResult, int maxResults);
	
	List<CompanyDTO> getRecentCompanys(int firstResult, int maxResults);

	CompanyDTO saveCompany(CompanyDTO companyDto);

	CompanyDTO deleteById(int id);

	CompanyDTO getCompanyByFriendURL(String friendURL);

	long countByFriendUrlExceptProductId(String friendURL, int companyId);

	long countByAll();

}
