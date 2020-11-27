package in.nit.view;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import in.nit.model.SaleOrder;

public class SaleOrderPdfView extends AbstractPdfView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(
			Map<String, 
			Object> model, 
			Document document, 
			PdfWriter writer,
			HttpServletRequest request, 
			HttpServletResponse response)
					throws Exception {
		
		//Download File
		response.addHeader("Content-Disposition", 
				"attachment;filename=Shipments.pdf");
		//Create Element
		Paragraph p =new Paragraph("WELCOME TO SHIPMENT TYPE");
		//add element to document
		document.add(p);
		//read data from model
		List<SaleOrder> list =
				(List<SaleOrder>)model.get("list");
		//Creating table with no of columns
		PdfPTable tab=new PdfPTable(9);
		tab.addCell("ID");
		tab.addCell("ORD CODE");
		tab.addCell("SHIP CODE");
		tab.addCell("CUSTOMER");
		tab.addCell("REF-NO");
		tab.addCell("STOCK-MOD");
		tab.addCell("STOCK-SOURCE");
		tab.addCell("DEF-STATUS ");
		tab.addCell("NOTE");
		//add data to table
		for(SaleOrder so:list) {
			tab.addCell(so.getSaleId().toString());
			tab.addCell(so.getOrdCode());
			tab.addCell(so.getShipCode());
			tab.addCell(so.getCustomer());
			tab.addCell(so.getRefNum());
			tab.addCell(so.getStMode());
			tab.addCell(so.getStSource());
			tab.addCell(so.getStatus());
			tab.addCell(so.getSaleDesc());
		}

		//add table to document
		document.add(tab);
		
		//print date and time
		document.add(new Paragraph(new Date().toString()));
	}

}
