package com.sips.webmvc.dao.image;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.image.Image;

@Repository
public interface ImageDao extends GenericDao<Image, Integer>{

	Image findById(int id);
	
	Image findRoot();
	
	List<Image> findByAll();
	
	List<Image> findByIds(String ids);
	
	List<Image> findByParentId(int parentId);
	
	Image saveImage(Image image);
	
	Image updateName(int id, String name);
	
	Image deleteById(int id);

	boolean canDeleteImage(int imageId);
	
	long countAtProduct(int imageId);
	
	long countAtSlideImage(int imageId);
	
	long countAtBlog(int imageId);
	
	long countAtConnectLink(int imageId);
	
	void updateChildrenFolderURL(int parentId);
	
}