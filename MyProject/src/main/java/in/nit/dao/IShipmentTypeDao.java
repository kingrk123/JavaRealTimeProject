package in.nit.dao;

import java.util.List;

import in.nit.model.ShipmentType;

public interface IShipmentTypeDao {
	Integer saveUom(ShipmentType ob);
	List<ShipmentType>getAllShipmentTypes();
	public void deleteShipmentType(Integer id);
	ShipmentType getOneShipmentType(Integer id);
	public void updateShipmentType(ShipmentType ob);
	public List<Object[]> getShipmentModeCount();
	
	public List<Object[]> getShipmentIdAndCode();
	boolean isShipCodeExist(String shipCode);
}
