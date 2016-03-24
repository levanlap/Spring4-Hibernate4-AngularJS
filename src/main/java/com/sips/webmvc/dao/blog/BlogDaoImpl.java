package com.sips.webmvc.dao.blog;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.blog.Blog;

@Repository
public class BlogDaoImpl extends GenericDaoImpl<Blog, Integer>
		implements BlogDao {

	public BlogDaoImpl() {
		setClazz(Blog.class);
	}
	
	@Override
	public Blog saveBlog(Blog blog) {
		if(blog.getId() != null){
			return (Blog) currentSession().merge(blog);
		}
		blog.setCreatedDate(new Date());
		currentSession().persist(blog);
		return blog;
		
	}
	
	@Override
	public Blog deleteById(int id) {
		Blog blog = (Blog) currentSession().get(Blog.class, id);
		currentSession().delete(blog);
		return blog;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Blog findBlogByFriendURL(String friendURL) {
		String hql = "select o from Blog o where o.friendURL = :friendURL";
		List<Blog> blogs = (List<Blog>) currentSession().createQuery(hql).setParameter("friendURL", friendURL).list();
		if(blogs != null && blogs.size() > 0){
			return blogs.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> findByAll(int firstResult, int maxResults) {
		String hql = "from Blog o ";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Blog>)query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> findRecentBlogs(int firstResult, int maxResults) {
		String hql = "from Blog o order by o.createdDate desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Blog>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Blog> findBlogsByName(int firstResult, int maxResults,String name) {
		String hql = "from Blog o where o.title  like '%"+name+"%' order by o.createdDate desc";
		Query query = currentSession().createQuery(hql);
		if(firstResult < 0){
			query.setFirstResult(0);
		}else{
			query.setFirstResult(firstResult);
		}
		if(maxResults > 0){
			query.setMaxResults(maxResults);
		}
		return (List<Blog>)query.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public long countByName(String name) {
		String hql = "select count(o.id) from Blog o where o.title like '%"+name+"%'";
		Query query = currentSession().createQuery(hql);
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByFriendUrlExceptProductId(String friendURL, int blogId) {
		String hql = "select count(o.id) from Blog o where o.friendURL = :friendURL";
		if(blogId > 0){
			hql += " and o.id != :blogId";
		}
		Query query = currentSession().createQuery(hql);
		query.setParameter("friendURL", friendURL);
		if(blogId > 0){
			query.setParameter("blogId", blogId);
		}
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countByAll() {
		String hql = "select count(o.id) from Blog o";
		Query query = currentSession().createQuery(hql);
		List<Long> counts  = (List<Long>) query.list();
		return counts.get(0).longValue();
	}

}