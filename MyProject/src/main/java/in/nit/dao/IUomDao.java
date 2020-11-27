package in.nit.dao;

import java.util.List;

import in.nit.model.Uom;

public interface IUomDao {
	Integer saveUom(Uom ob);
	List<Uom>getAllUom();
	public void deleteUom(Integer id);
	Uom getOneUom(Integer id);
	public void updateUom(Uom ob);
	List<Object[]> getUomIdAndUomModel();
	
	public List<Object[]> getUomModeCount();
	
	boolean isUomModelExist(String uomModel);
}
