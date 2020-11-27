/**
 * 
 */
package in.nit.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import in.nit.model.Uom;

/**
 * @author ranvi
 *
 */
public class UomExcelView extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(
			Map<String, 
			Object> model, 
			Workbook workbook, 
			HttpServletRequest request,
			HttpServletResponse response)
					throws Exception {
				
		//FILENAME
		response.addHeader(
				"Content-Disposition",
				"attachment;filename=Uom.xlsx");
		Sheet s=workbook.createSheet("Uom");
		
		//Construct -row-0
		setHeader(s);
		
		//read model data
		List<Uom> list= (List<Uom>)model.get("list");
		setBody(s,list);
	}

	private void setBody(Sheet s, List<Uom> list) {
		int count=1;
		for(Uom st:list) {
			Row r=s.createRow(count++);
			r.createCell(0).setCellValue(st.getUomId());
			r.createCell(1).setCellValue(st.getUomType());
			r.createCell(2).setCellValue(st.getUomModel());
			r.createCell(5).setCellValue(st.getUomDesc());

		}
		
	}

	private void setHeader(Sheet s) {
		Row r=s.createRow(0);
		r.createCell(0).setCellValue("ID");
		r.createCell(1).setCellValue("UOM TYPE");
		r.createCell(2).setCellValue("UOM MODEL");
		r.createCell(5).setCellValue("NOTE");
		
	}

}
