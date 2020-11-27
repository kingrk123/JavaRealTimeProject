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

import in.nit.model.WhUserType;

public class WhUserTypePdfView extends AbstractPdfView {

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
				"attachment;filename=WhUserType.pdf");
		//Create Element
		Paragraph p =new Paragraph("WELCOME TO WhUser TYPE");
		//add element to document
		document.add(p);
		//read data from model
		List<WhUserType> list =
				(List<WhUserType>)model.get("list");
		//Creating table with no of columns
		//create a Tbale with no.of columns
				PdfPTable tab=new PdfPTable(9);
				tab.addCell("ID");
				tab.addCell("TYPE");
				tab.addCell("CODE");
				tab.addCell("USER FOR");
				tab.addCell("EMAIL");
				tab.addCell("CONTACT");
				tab.addCell("ID TYPE");
				tab.addCell("OTHER ID");
				tab.addCell("ID NO");
				//add data to table
				for(WhUserType wt:list) {
					tab.addCell(wt.getId().toString());
					tab.addCell(wt.getUserType());
					tab.addCell(wt.getUserCode());
					tab.addCell(wt.getUserFor());
					tab.addCell(wt.getUserMail());
					tab.addCell(wt.getUserContact());
					tab.addCell(wt.getIdType());
					tab.addCell(wt.getIfOther());
					tab.addCell(wt.getIdNum());
				}
				//add table to document
				document.add(tab);
				//print date and time
				document.add(new Paragraph(new Date().toString()));
				
			}
}