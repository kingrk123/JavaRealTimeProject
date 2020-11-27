package in.nit.service;

import java.util.List;

import in.nit.model.ShipmentType;

public interface IShipmentTypeService {
	Integer saveShipmentType(ShipmentType ob);
	List<ShipmentType>getAllShipmentTypes();
	public void deleteShipmentType(Integer id);
	ShipmentType getOneShipmentType(Integer id);
	public void updateShipmentType(ShipmentType ob);
	public List<Object[]> getShipmentModeCount();

	public List<Object[]> getShipmentIdAndCode();
	boolean isShipCodeExist(String shipCode);

}
