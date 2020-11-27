package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IWhUserTypeDao;
import in.nit.model.WhUserType;

/**
 * @author:RAGHU SIR 
 *  Generated F/w:SHWR-Framework 
 */
@Repository
public class WhUserTypeDaoImpl implements IWhUserTypeDao {
	@Autowired
	private HibernateTemplate ht;

	@Override
	public Integer saveWhUserType(WhUserType whusertype) {
		return (Integer)ht.save(whusertype);
	}

	@Override
	public void updateWhUserType(WhUserType whusertype) {
		ht.update(whusertype);
	}

	@Override
	public void deleteWhUserType(Integer id) {
		ht.delete(new WhUserType(id));
	}

	@Override
	public WhUserType getOneWhUserType(Integer id) {
		return ht.get(WhUserType.class,id);
	}

	@Override
	public List<WhUserType> getAllWhUserTypes() {
		return ht.loadAll(WhUserType.class);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Object[]> getWhUserTypeIdAndCode(String userType) {
		String hql=" select id, userCode from "+WhUserType.class.getName()+" where userType=?0";
		return (List<Object[]>) ht.find(hql, userType);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Object[]> getWhUserTypeModeCount() {
		String hql ="select userType, count (userType) from in.nit.model.WhUserType group by userType";
		return (List<Object[]>)ht.find(hql);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public boolean isUserCodeExist(String userCode) {
		boolean flag =false;
		String hql ="select count(userCode) from in.nit.model.WhUserType where  userCode=?0";
		@SuppressWarnings("deprecation")
		List<Long> list = (List<Long>) ht.find(hql, userCode);
		if(list!=null && !list.isEmpty()) {
			long count = list.get(0);
			if (count == 0 ) flag =false;
			else flag = true;
		}
		return flag;
	}
}






