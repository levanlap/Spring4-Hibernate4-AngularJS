package com.sips.webmvc.dao.blog;

import java.util.List;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.blog.Blog;

public interface BlogDao extends GenericDao<Blog, Integer> {

    Blog saveBlog(Blog convertEntite);

    Blog deleteById(int id);

    Blog findBlogByFriendURL(String friendURL);

    List<Blog> findByAll(int firstResult, int maxResults);

    List<Blog> findRecentBlogs(int firstResult, int maxResults);

    List<Blog> findBlogsByName(int firstResult, int maxResults, String name);

    long countByFriendUrlExceptProductId(String friendURL, int blogId);

    long countByAll();

    long countByName(String name);

}