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

import in.nit.model.Uom;

public class UomPdfView extends AbstractPdfView {

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
				"attachment;filename=Uom.pdf");
		//Create Element
		Paragraph p =new Paragraph("WELCOME TO Uom");
		//add element to document
		document.add(p);
		//read data from model
		List<Uom> list =
				(List<Uom>)model.get("list");
		//Creating table with no of columns
		PdfPTable t = new PdfPTable(4);
		t.addCell("ID");
		t.addCell("UOM TYPE");
		t.addCell("MODEL");
		t.addCell("NOTE");
		
		//adding data to table
		
		for(Uom st:list) {
			t.addCell(st.getUomId().toString());
			t.addCell(st.getUomType());
			t.addCell(st.getUomModel());
			t.addCell(st.getUomDesc());
		}
		//add table to document
		document.add(t);
		
		//print date and time
		document.add(new Paragraph(new Date().toString()));
	}

}
