package com.sips.webmvc.dao.image;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sips.webmvc.dao.generic.GenericDaoImpl;
import com.sips.webmvc.model.image.Image;
import com.sips.webmvc.util.StringUtil;

@Repository
public class ImageDaoImpl extends GenericDaoImpl<Image, Integer> implements ImageDao {

	@Override
	public Image findById(int id) {
		return (Image) currentSession().get(Image.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Image findRoot() {
		List<Image> images = (List<Image>) currentSession().createQuery("from Image o where o.id = 1").list();
		return images.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Image> findByAll() {
		List<Image> images = (List<Image>) currentSession().createQuery("from Image ").list();
		return images;
	}
	
	@Override
	public List<Image> findByIds(String ids) {
		/*String hql = "from Image o where o.id in ( :ids )";
		List<Image> images = (List<Image>) currentSession().createQuery(hql).setParameter("ids", ids).list();*/
		List<Image> images = new ArrayList<Image>();
		if( ids != null && !ids.isEmpty()){
			for(String id : ids.split(",")){
				if(id != null && !id.isEmpty()){
					images.add( findById(Integer.parseInt(id)) );
				}
			}
		}
		return images;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Image> findByParentId(int parentId) {
		String hql = "from Image o where o.parent.id = :parentId order by o.created desc";
		Query query = currentSession().createQuery(hql);
		query.setParameter("parentId", parentId);
		List<Image> images = (List<Image>) query.list();
		return images;
	}

	@Override
	public Image saveImage(Image image) {
		image.setCreated(new Date());
		if(image.getId() != null){
			return (Image) currentSession().merge(image);
		}
		currentSession().persist(image);
		return image;
	}
	
	@Override
	public Image updateName(int id, String name) {
		Image image = findById(id);
		image.setName(name);
		currentSession().update(image);
		return image;
	}
	
	@Override
	public void updateChildrenFolderURL(int parentId){
		System.out.println("==========================================updateChildrenFolderURL");
		Image parent = findById(parentId);
		System.out.println("parentId: " + parentId);
		List<Image> children = findByParentId(parentId);
		System.out.println("children : " + children);
		if(children != null && children.size() != 0){
			for(Image folder : children){
				if(parent.getUrl().equals("/")){
					folder.setUrl( "/" + StringUtil.convertToAscii(folder.getName()) );
				}else{
					folder.setUrl( parent.getUrl() + "/" + StringUtil.convertToAscii(folder.getName()) );
				}
				System.out.println("folder.getUrl(): "+folder.getUrl());
				update(folder);
				updateChildrenFolderURL(folder.getId());
			}
		}
	}

	@Override
	public Image deleteById(int id) {
		Image image = (Image) currentSession().get(Image.class, id);
		currentSession().delete(image);
		return image;
	}

	@Override
	public boolean canDeleteImage(int imageId) {
		return (findById(imageId).getChildren().size() == 0
				&& countAtProduct(imageId) == 0
				&& countAtSlideImage(imageId) == 0
				&& countAtBlog(imageId) == 0
				&& countAtConnectLink(imageId) == 0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countAtProduct(int imageId) {
		// MainImage
		String hql = "select count(o.id) from Product o where o.imageLink = :imageId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("imageId", String.valueOf(imageId)).list();
		
		// ImageList
		String hql2 = "select count(o.id) from Product o where o.imageList like :imageId";
		List<Long> counts2  = (List<Long>) currentSession().createQuery(hql2).setParameter("imageId", "%" + String.valueOf(imageId) + ",%").list();
		return counts.get(0).longValue() + counts2.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countAtSlideImage(int imageId) {
		String hql = "select count(o.id) from SlideImage o where o.image.id = :imageId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("imageId", imageId).list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countAtBlog(int imageId) {
		String hql = "select count(o.id) from Blog o where o.image.id = :imageId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("imageId", imageId).list();
		return counts.get(0).longValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public long countAtConnectLink(int imageId) {
		String hql = "select count(o.id) from ConnectLink o where o.linkImage = :imageId";
		List<Long> counts  = (List<Long>) currentSession().createQuery(hql).setParameter("imageId", String.valueOf(imageId)).list();
		return counts.get(0).longValue();
	}

}