package com.sips.webmvc.dao.slideimage;

import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.slideimage.SlideImage;

@Repository
public class SlideImageDaoImpl extends GenericDaoImpl<SlideImage, Integer> implements SlideImageDao {

	
	public SlideImageDaoImpl() {
		setClazz(SlideImage.class);
	}
	
	@Override
	public SlideImage saveSlideImage(SlideImage slideImage) {
		if(slideImage.getId() != null){
			return (SlideImage) currentSession().merge(slideImage);
		}
		currentSession().persist(slideImage);
		return slideImage;
	}

	@Override
	public SlideImage deleteById(int id) {
		SlideImage slideImage = (SlideImage) currentSession().get(SlideImage.class, id);
		currentSession().delete(slideImage);
		return slideImage;
	}
	
}