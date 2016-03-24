package com.sips.webmvc.service.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.company.CompanyDao;
import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.model.company.Company;
import com.sips.webmvc.service.image.ImageService;

@Service
@Transactional
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private ImageService imageService;
	
	@Override
	public Company toEntity(CompanyDTO dto) {
		if(dto == null){
			return null;
		}
		Company entity = new Company();
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		entity.setPhone(dto.getPhone());
		entity.setEmail(dto.getEmail());
		entity.setAddress(dto.getAddress());
		entity.setLongitude(dto.getLongitude());
		entity.setLatitude(dto.getLatitude());
		try{
			ObjectMapper objectMapper = new ObjectMapper();
			entity.setBrands( objectMapper.writeValueAsString(dto) );
		}catch(Exception exc){
			exc.printStackTrace();
		}
		return entity;
	}
	
	@Override
	public CompanyDTO toDTO(Company entity) {
		if(entity == null){
			return null;
		}
		CompanyDTO dto = new CompanyDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setPhone(entity.getPhone());
		dto.setEmail(entity.getEmail());
		dto.setAddress(entity.getAddress());
		dto.setLongitude(entity.getLongitude());
		dto.setLatitude(entity.getLatitude());
		if(entity != null){
			try{
				ObjectMapper objectMapper = new ObjectMapper();
				CompanyDTO company = objectMapper.readValue(entity.getBrands(), CompanyDTO.class);
				dto.setBrands(company.getBrands());
			}catch(Exception exc){
				exc.printStackTrace();
			}
		}
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CompanyDTO> toDTOs(List<Company> entities) {
		List<CompanyDTO> dtos = new ArrayList<CompanyDTO>();
		if( entities != null && entities.size() > 0){
			for( Company e : entities ){
				CompanyDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public CompanyDTO getById(int id) {
		return toDTO(companyDao.find(id));
	}

	@Override
	@Transactional(readOnly = true)
	public List<CompanyDTO> getByAll() {
		return toDTOs(companyDao.findAll());
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CompanyDTO> getByAll(int firstResult, int maxResults) {
		return toDTOs(companyDao.findByAll(firstResult, maxResults));
	}

	@Override
	@Transactional(readOnly = true)
	public CompanyDTO getCompanyByFriendURL(String friendURL) {
		return toDTO( companyDao.findCompanyByFriendURL(friendURL) );
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<CompanyDTO> getRecentCompanys(int firstResult, int maxResults) {
		return toDTOs(companyDao.findRecentCompanys(firstResult, maxResults));
	}

	@Override
	public CompanyDTO saveCompany(CompanyDTO companyDto) {
		return toDTO(companyDao.saveCompany(toEntity(companyDto)));
	}
	
	@Override
	public CompanyDTO deleteById(int id) {
		return toDTO( companyDao.deleteById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public long countByFriendUrlExceptProductId(String friendURL, int companyId) {
		return companyDao.countByFriendUrlExceptProductId(friendURL, companyId);
	}

	@Override
	@Transactional(readOnly = true)
	public long countByAll() {
		return companyDao.countByAll();
	}

	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		
		/*CompanyDTO c = new CompanyDTO();
		c.setName("aa");
		c.setPhone("0");
		c.setEmail("email");
		c.setAddress("aaa");
		c.setLatitude("00000");
		c.setLongitude("000000");
		
		BrandDTO b = new BrandDTO();
		b.setName("aa");
		b.setPhone("0");
		b.setAddress("aaa");
		b.setLatitude("00000");
		b.setLongitude("000000");
		c.getBrands().add(b);
		
		b = new BrandDTO();
		b.setName("aa");
		b.setPhone("0");
		b.setAddress("aaa");
		b.setLatitude("00000");
		b.setLongitude("000000");
		c.getBrands().add(b);
		
		String json = mapper.writeValueAsString(c);
		
		System.out.println(json);*/
		
		String json = "{\"id\":null,\"name\":\"aa\",\"phone\":\"0\",\"email\":\"email\",\"address\":\"aaa\",\"longitude\":\"000000\",\"latitude\":\"00000\",\"brands\":[{\"name\":\"aa\",\"phone\":\"0\",\"address\":\"aaa\",\"longitude\":\"000000\",\"latitude\":\"00000\"},{\"name\":\"aa\",\"phone\":\"0\",\"address\":\"aaa\",\"longitude\":\"000000\",\"latitude\":\"00000\"}]}";
		CompanyDTO dto = mapper.readValue(json, CompanyDTO.class);
		System.out.println(dto.getBrands());
		
		
	}
}
