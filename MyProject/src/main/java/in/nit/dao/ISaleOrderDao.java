package in.nit.dao;

import java.util.List;

import in.nit.model.SaleOrder;

public interface ISaleOrderDao {
	Integer saveUom(SaleOrder ob);
	List<SaleOrder>getAllSaleOrders();
	public void deleteSaleOrder(Integer id);
	SaleOrder getOneSaleOrder(Integer id);
	public void updateSaleOrder(SaleOrder ob);
	public List<Object[]> getSaleOrderModeCount();
}
