package in.nit.service;

import java.util.List;

import in.nit.model.Part;

public interface IPartService {
	Integer savePart(Part ob);
	List<Part>getAllPart();
	public void deletePart(Integer id);
	Part getOnePart(Integer id);
	public void updatePart(Part ob);
	public List<Object[]> getPartModeCount();
	
	List<Object[]> getPartIdAndCodes();

}
