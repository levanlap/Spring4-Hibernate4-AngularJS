package com.sips.webmvc.service.blog;

import java.util.List;

import com.sips.webmvc.dto.blog.BlogDTO;
import com.sips.webmvc.model.blog.Blog;

public interface BlogService {
	
	Blog toEntity(BlogDTO dto);
	
	BlogDTO toDTO(Blog entity);
	
	List<BlogDTO> toDTOs(List<Blog> entities);

	BlogDTO getById(int id);
	
	List<BlogDTO> getByAll();
	
	List<BlogDTO> getByAll(int firstResult, int maxResults);
	
	List<BlogDTO> getRecentBlogs(int firstResult, int maxResults);

	BlogDTO saveBlog(BlogDTO blogDto);

	BlogDTO deleteById(int id);

	BlogDTO getBlogByFriendURL(String friendURL);

	long countByFriendUrlExceptProductId(String friendURL, int blogId);

	long countByAll();

	List<BlogDTO> findBlogsByName(int firstResult, int maxResults, String name);

	long countByName(String name);

}
