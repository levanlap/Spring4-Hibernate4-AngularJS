package com.sips.webmvc.dao.slideimage;

import com.sips.webmvc.dao.generic.GenericDao;
import com.sips.webmvc.model.slideimage.SlideImage;

public interface SlideImageDao extends GenericDao<SlideImage, Integer>{

	SlideImage saveSlideImage(SlideImage slideImage);
	
	SlideImage deleteById(int id);
	
}