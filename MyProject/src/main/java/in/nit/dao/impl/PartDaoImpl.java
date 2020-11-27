package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IPartDao;
import in.nit.model.Part;

@Repository
public class PartDaoImpl implements IPartDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer savePart(Part ob) {
		return (Integer)ht.save(ob);
	}
	
	public List<Part> getAllPart() {
		System.out.println("dao");
		return ht.loadAll(Part.class);
	}
	
	
	public void deletePart(Integer id) {
		ht.delete(new Part(id));
	}
	
	
	public Part getOnePart(Integer id) {
		return ht.get(Part.class, id);
	}
	@Override
	public void updatePart(Part ob) {
		ht.update(ob);
		
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getPartModeCount() {
		String hql ="select partCode, count (partCode) from in.nit.model.Part group by partCode";
		return (List<Object[]>)ht.find(hql);
	}

	@Override
	public List<Object[]> getPartIdAndCodes() {
		String hql=" select id,partCode from in.nit.model.Part ";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Object[]> list=(List<Object[]>) ht.find(hql);
		return list;
	}

	
}
