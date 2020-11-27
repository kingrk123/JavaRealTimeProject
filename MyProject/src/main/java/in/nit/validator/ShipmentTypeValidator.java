package in.nit.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import in.nit.model.ShipmentType;
import in.nit.service.IShipmentTypeService;

@Component
public class ShipmentTypeValidator implements Validator {

	@Autowired
	private IShipmentTypeService service;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return ShipmentType.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ShipmentType shipmentType = (ShipmentType)target;
		
		if(service.isShipCodeExist(shipmentType.getShipCode())) {
			errors.rejectValue("ShipCode", null, "Shipment Code '"+ shipmentType.getShipCode()+"'Already Exist");
		}

	}

}
