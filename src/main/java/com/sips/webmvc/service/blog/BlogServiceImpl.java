package com.sips.webmvc.service.blog;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.blog.BlogDao;
import com.sips.webmvc.dto.blog.BlogDTO;
import com.sips.webmvc.model.blog.Blog;
import com.sips.webmvc.service.image.ImageService;

@Service
@Transactional
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private ImageService imageService;
	
	@Override
	public Blog toEntity(BlogDTO dto) {
		if(dto == null){
			return null;
		}
		Blog entity = new Blog();
		entity.setId(dto.getId());
		entity.setTitle(dto.getTitle());
		entity.setFriendURL(dto.getFriendURL());
		entity.setImage(imageService.toEntity(dto.getImage()));
		entity.setContent(dto.getContent());
		entity.setCreatedDate(dto.getCreatedDate());
		return entity;
	}
	
	@Override
	public BlogDTO toDTO(Blog entity) {
		if(entity == null){
			return null;
		}
		BlogDTO dto = new BlogDTO();
		dto.setId(entity.getId());
		dto.setTitle(entity.getTitle());
		dto.setFriendURL(entity.getFriendURL());
		try {
			dto.setImage(imageService.toDTO(entity.getImage()));
		} catch (Exception e) {
			// TODO: handle exception
		}
		dto.setContent(entity.getContent());
		dto.setCreatedDate(entity.getCreatedDate());
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<BlogDTO> toDTOs(List<Blog> entities) {
		List<BlogDTO> dtos = new ArrayList<BlogDTO>();
		if( entities != null && entities.size() > 0){
			for( Blog e : entities ){
				BlogDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public BlogDTO getById(int id) {
		return toDTO(blogDao.find(id));
	}

	@Override
	@Transactional(readOnly = true)
	public List<BlogDTO> getByAll() {
		return toDTOs(blogDao.findAll());
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<BlogDTO> getByAll(int firstResult, int maxResults) {
		return toDTOs(blogDao.findByAll(firstResult, maxResults));
	}

	@Override
	@Transactional(readOnly = true)
	public BlogDTO getBlogByFriendURL(String friendURL) {
		return toDTO( blogDao.findBlogByFriendURL(friendURL) );
	}
	
	@Override
	@Transactional
	public List<BlogDTO> getRecentBlogs(int firstResult, int maxResults) {
		return toDTOs(blogDao.findRecentBlogs(firstResult, maxResults));
	}

	@Override
	public BlogDTO saveBlog(BlogDTO blogDto) {
		return toDTO(blogDao.saveBlog(toEntity(blogDto)));
	}
	
	@Override
	public BlogDTO deleteById(int id) {
		return toDTO( blogDao.deleteById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public long countByFriendUrlExceptProductId(String friendURL, int blogId) {
		return blogDao.countByFriendUrlExceptProductId(friendURL, blogId);
	}

	@Override
	@Transactional(readOnly = true)
	public long countByAll() {
		return blogDao.countByAll();
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<BlogDTO> findBlogsByName(int firstResult, int maxResults,String name) {
		return toDTOs(blogDao.findBlogsByName(firstResult, maxResults, name));
	}
	
	@Override
	@Transactional(readOnly = true)
	public long countByName(String name) {
		return blogDao.countByName(name);
	}

}
