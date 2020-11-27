package in.nit.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.nit.dao.IPartDao;
import in.nit.model.Part;
import in.nit.service.IPartService;

@Service
public class PartServiceImpl implements IPartService {
	
	@Autowired
	private IPartDao dao;
	@Transactional
	public Integer savePart(Part ob) {
		return dao.savePart(ob);	
	}
	
	@Transactional
	public void deletePart(Integer id) {
		dao.deletePart(id);
	}
	
	@Transactional(readOnly = true)
	public Part getOnePart(Integer id) {
		return dao.getOnePart(id);
	}
	
	@Transactional
	public void updatePart(Part ob) {
		dao.updatePart(ob);
	}

	@Transactional(readOnly = true)
	public List<Part> getAllPart() {
		List<Part> list = dao.getAllPart();
		Collections.sort(list,(o1,o2)->o1.getId()-o2.getId());
		return list;
	}

	@Override
	public List<Object[]> getPartModeCount() {
		return dao.getPartModeCount();
	}

	@Override
	public List<Object[]> getPartIdAndCodes() {
		return dao.getPartIdAndCodes();
	}


}
