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

import in.nit.model.SaleOrder;

/**
 * @author ranvi
 *
 */
public class SaleOrderExcelView extends AbstractXlsxView {

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
				"attachment;filename=SOrder.xlsx");
		Sheet s=workbook.createSheet("SALE ORDER");
		
		//Construct -row-0
		setHeader(s);
		
		//read model data
		List<SaleOrder> list= (List<SaleOrder>)model.get("list");
		setBody(s,list);
	}

	private void setBody(Sheet s, List<SaleOrder> list) {
		int count=1;
		for(SaleOrder st:list) {
			Row r=s.createRow(count++);
			r.createCell(0).setCellValue(st.getSaleId());
			r.createCell(1).setCellValue(st.getOrdCode());
			r.createCell(2).setCellValue(st.getShipCode());
			r.createCell(3).setCellValue(st.getCustomer());
			r.createCell(4).setCellValue(st.getRefNum());
			r.createCell(5).setCellValue(st.getStMode());
			r.createCell(5).setCellValue(st.getStSource());
			r.createCell(5).setCellValue(st.getStatus());
			r.createCell(5).setCellValue(st.getSaleDesc());


		}
		
	}

	private void setHeader(Sheet s) {
		Row r=s.createRow(0);
		r.createCell(0).setCellValue("ID");
		r.createCell(1).setCellValue("ORD CODE");
		r.createCell(2).setCellValue("SHIP CODE");
		r.createCell(3).setCellValue("CUSTOMER");
		r.createCell(4).setCellValue("REF-NUM");
		r.createCell(5).setCellValue("STOCK-MODE");
		r.createCell(6).setCellValue("STOCK-SRC");
		r.createCell(7).setCellValue("DEF-STATUS");
		r.createCell(7).setCellValue("DESCRIPTION");
	}
    

}
