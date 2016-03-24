package com.sips.webmvc.dao.users;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.users.User;

public interface UserDao extends GenericDao<User, Integer>{

	User findByUserName(String username);

	List<User> getUsers(int firstResult, int maxResults);

	long countAll();

}