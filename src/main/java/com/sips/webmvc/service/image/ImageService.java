package com.sips.webmvc.service.image;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.model.image.Image;


public interface ImageService {
	
	Image toEntity(ImageDTO dto);
	
	ImageDTO toDTO(Image entity);
	
	ImageDTO toDTO(Image entity, boolean copyParent, boolean copyChildren, boolean copyChildrenFolder, boolean copyChildrenFile);
	
	List<ImageDTO> toDTOs(List<Image> entities, boolean copyParent, boolean copyChildren, boolean copyChildrenFolder, boolean copyChildrenFile);
	
	ImageDTO getById(int id);
	
	ImageDTO getRootAndTreeChildrenFolder();
	
	List<ImageDTO> getByIds(String ids);
	
	ImageDTO getChildrenByParentId(int parentId);
	
	ImageDTO saveImage(ImageDTO image);
	
	ImageDTO updateName(int id, String name);
	
	ImageDTO deleteById(int id);
	
	List<ImageDTO> toDTOs(List<Image> entities);

	List<ImageDTO> getByAll();
	
	boolean canDeleteImage(int imageId);
	
	ImageDTO createNewFileSystem(ImageDTO image, MultipartFile file) throws IOException;

	void deleteFileSystem(ImageDTO image) throws IOException;

}
