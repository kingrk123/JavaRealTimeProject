package in.nit.service;

import java.util.List;

import in.nit.model.SaleOrder;

public interface ISaleOrderService {
	Integer saveSaleOrder(SaleOrder ob);
	List<SaleOrder>getAllSaleOrders();
	public void deleteSaleOrder(Integer id);
	SaleOrder getOneSaleOrder(Integer id);
	public void updateSaleOrder(SaleOrder ob);
	public List<Object[]> getSaleOrderModeCount();


}
