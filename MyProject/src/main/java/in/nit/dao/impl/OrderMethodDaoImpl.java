package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IOrderMethodDao;
import in.nit.model.OrderMethod;

@Repository
public class OrderMethodDaoImpl implements IOrderMethodDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer saveUom(OrderMethod ob) {
		return (Integer)ht.save(ob);
	}
	
	public List<OrderMethod> getAllOrderMethods() {
		System.out.println("dao");
		return ht.loadAll(OrderMethod.class);
	}
	
	
	public void deleteOrderMethod(Integer id) {
		ht.delete(new OrderMethod(id));
	}
	
	
	public OrderMethod getOneOrderMethod(Integer id) {
		return ht.get(OrderMethod.class, id);
	}
	@Override
	public void updateOrderMethod(OrderMethod ob) {
		ht.update(ob);
		
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Object[]> getOrderMethodModeCount() {
		String hql ="select orderType, count (orderType) from in.nit.model.OrderMethod group by orderType";
		return (List<Object[]>)ht.find(hql);
	}
}
