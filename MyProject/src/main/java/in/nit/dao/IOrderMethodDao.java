package in.nit.dao;

import java.util.List;

import in.nit.model.OrderMethod;

public interface IOrderMethodDao {
	Integer saveUom(OrderMethod ob);
	List<OrderMethod>getAllOrderMethods();
	public void deleteOrderMethod(Integer id);
	OrderMethod getOneOrderMethod(Integer id);
	public void updateOrderMethod(OrderMethod ob);
	public List<Object[]> getOrderMethodModeCount();
}