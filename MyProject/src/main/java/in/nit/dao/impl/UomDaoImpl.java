package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IUomDao;
import in.nit.model.Uom;

@Repository
public class UomDaoImpl implements IUomDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer saveUom(Uom ob) {
		return (Integer)ht.save(ob);
	}
	
	
	public void deleteUom(Integer id) {
		ht.delete(new Uom(id));
	}
	
	
	public Uom getOneUom(Integer id) {
		return ht.get(Uom.class, id);
	}
	@Override
	public void updateUom(Uom ob) {
		ht.update(ob);
		
	}

	@Override
	public List<Uom> getAllUom() {
		System.out.println("dao");
		return ht.loadAll(Uom.class);	}
	
	@Override
	public List<Object[]> getUomIdAndUomModel() {
		String hql = " select uomId,uomModel from in.nit.model.Uom";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Object[]> list = (List<Object[]>)ht.find(hql);
		return list;
	}


	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getUomModeCount() {
		String hql ="select uomType, count (uomType) from in.nit.model.Uom group by uomType";
		return (List<Object[]>)ht.find(hql);
	}


	@Override
	public boolean isUomModelExist(String uomModel) {
		boolean flag = false;
		String hql ="select count(uomModel) from in.nit.model.Uom where uomModel=?0";
		List<Long> list = (List<Long>)ht.find(hql,uomModel);
		if(list!=null &&  !list.isEmpty()) {
			long count = list.get(0); 
			if(count ==0) flag=false;
			else flag = true;
		}
		return flag;
	}
}
