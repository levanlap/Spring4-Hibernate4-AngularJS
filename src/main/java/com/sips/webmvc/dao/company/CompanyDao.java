package com.sips.webmvc.dao.company;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.company.Company;

public interface CompanyDao extends GenericDao<Company, Integer> {

	Company saveCompany(Company convertEntite);
	
	Company deleteById(int id);

	Company findCompanyByFriendURL(String friendURL);

	List<Company> findByAll(int firstResult, int maxResults);
	
	List<Company> findRecentCompanys(int firstResult, int maxResults);

	long countByFriendUrlExceptProductId(String friendURL, int blogId);

	long countByAll();

}