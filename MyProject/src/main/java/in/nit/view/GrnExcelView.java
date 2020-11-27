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

import in.nit.model.Grn;

/**
 * @author ranvi
 *
 */
public class GrnExcelView extends AbstractXlsxView {

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
				"attachment;filename=Grn.xlsx");
		Sheet s=workbook.createSheet("SHIPMENT TYPES");
		
		//Construct -row-0
		setHeader(s);
		
		//read model data
		List<Grn> list= (List<Grn>)model.get("list");
		setBody(s,list);
	}

	private void setBody(Sheet s, List<Grn> list) {
		int count=1;
		for(Grn st:list) {
			Row r=s.createRow(count++);
			r.createCell(0).setCellValue(st.getId());
			r.createCell(1).setCellValue(st.getGrnCode());
			r.createCell(2).setCellValue(st.getGrnType());
			r.createCell(3).setCellValue(st.getGrnCode());
			r.createCell(4).setCellValue(st.getNote());
		}
		
	}

	private void setHeader(Sheet s) {
		Row r=s.createRow(0);
		r.createCell(0).setCellValue("ID");
		r.createCell(1).setCellValue("CODE");
		r.createCell(2).setCellValue("TYPE");
		r.createCell(3).setCellValue("Order Code");
		r.createCell(5).setCellValue("NOTE");
		
	}

}
