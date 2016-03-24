package com.sips.webmvc.dao.company;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.company.Company;

@Repository
public class CompanyDaoImpl extends GenericDaoImpl<Company, Integer>
		implements CompanyDao {

	public CompanyDaoImpl() {
		setClazz(Company.class);
	}
	
	@Override
	public Company saveCompany(Company company) {
		if(company.getId() != null){
			return (Company) currentSession().merge(company);
		}
		currentSession().persist(company);
		return company;
		
	}
	
	@Override
	public Company deleteById(int id) {
		Company company = (Company) currentSession().get(Company.class, id);
		currentSession().delete(company);
		return company;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Company findCompanyByFriendURL(String friendURL) {
		String hql = "select o from Company o where o.friendURL = :friendURL";
		List<Company> companys = (List<Company>) currentSession().createQuery(hql).setParameter("friendURL", friendURL).list();
		if(companys != null && companys.size() > 0){
			return companys.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Company> findByAll(int firstResult, int maxResults) {
		String hql = "from Company o ";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Company>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Company> findRecentCompanys(int firstResult, int maxResults) {
		String hql = "from Company o order by o.createdDate desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Company>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrlExceptProductId(String friendURL, int companyId) {
		String hql = "select count(o.id) from Company o where o.friendURL = :friendURL";
		if(companyId > 0){
			hql += " and o.id != :companyId";
		}
		
		Query query = currentSession().createQuery(hql);
		query.setParameter("friendURL", friendURL);
		if(companyId > 0){
			query.setParameter("companyId", companyId);
		}
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByAll() {
		String hql = "select count(o.id) from Company o";
		
		Query query = currentSession().createQuery(hql);
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}

}