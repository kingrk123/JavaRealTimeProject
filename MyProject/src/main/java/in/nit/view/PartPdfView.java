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

import in.nit.model.Part;

public class PartPdfView extends AbstractPdfView {

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
				"attachment;filename=Part.pdf");
		//Create Element
		Paragraph p =new Paragraph("WELCOME TO Part");
		//add element to document
		document.add(p);
		//read data from model
		List<Part> list =
				(List<Part>)model.get("list");
		//Creating table with no of columns
		PdfPTable t = new PdfPTable(6);
		t.addCell("ID");
		t.addCell("CODE");
		t.addCell("LENGTH");
		t.addCell("WIDTH");
		t.addCell("HEIGHT");
		t.addCell("COST");
		t.addCell("CURRENCY");
		t.addCell("NOTE");
		
		//adding data to table
		
		for(Part st:list) {
			t.addCell(st.getId().toString());
			t.addCell(st.getPartCode());
			t.addCell(st.getPartLen().toString());
			t.addCell(st.getPartWid().toString());
			t.addCell(st.getPartHgt().toString());
			t.addCell(st.getBaseCost().toString());
			t.addCell(st.getBaseCurrency());
			t.addCell(st.getNote());

			
		}
		//add table to document
		document.add(t);
		
		//print date and time
		document.add(new Paragraph(new Date().toString()));
	}

}