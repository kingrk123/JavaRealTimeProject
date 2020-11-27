package in.nit.service;

import java.util.List;

import in.nit.model.Uom;

public interface IUomService {
	Integer saveUom(Uom ob);
	List<Uom>getAllUoms();
	public void deleteUom(Integer id);
	Uom getOneUom(Integer id);
	public void updateUom(Uom ob);
	List<Object[]> getUomIdAndUomModel();
	public List<Object[]> getUomModeCount();

	public boolean isUomModelExist(String uomModel);



}
