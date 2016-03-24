package com.sips.webmvc.dao.users;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.users.User;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User, Integer> implements
		UserDao {
	public UserDaoImpl() {
		setClazz(User.class);
	}

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {
		List<User> users = new ArrayList<User>();
		users = currentSession().createQuery("from User where username=?")
				.setParameter(0, username).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers(int firstResult, int maxResults) {
		String hql = "from User order by name desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<User>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countAll() {
		String hql = "select count(*) from User";
		
		Query query = currentSession().createQuery(hql);
		
		List<Long> counts  = (List<Long>) query.list();
		
		return counts.get(0).longValue();
	}


}