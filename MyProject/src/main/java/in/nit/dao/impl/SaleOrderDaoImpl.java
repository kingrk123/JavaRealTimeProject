package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.ISaleOrderDao;
import in.nit.model.SaleOrder;

@Repository
public class SaleOrderDaoImpl implements ISaleOrderDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer saveUom(SaleOrder ob) {
		return (Integer)ht.save(ob);
	}
	
	public List<SaleOrder> getAllSaleOrders() {
		System.out.println("dao");
		return ht.loadAll(SaleOrder.class);
	}
	
	
	public void deleteSaleOrder(Integer id) {
		ht.delete(new SaleOrder(id));
	}
	
	
	public SaleOrder getOneSaleOrder(Integer id) {
		return ht.get(SaleOrder.class, id);
	}
	@Override
	public void updateSaleOrder(SaleOrder ob) {
		ht.update(ob);
		
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Object[]> getSaleOrderModeCount() {
		String hql ="select customer, count (customer) from in.nit.model.SaleOrder group by customer";
		return (List<Object[]>)ht.find(hql);
	}
}
