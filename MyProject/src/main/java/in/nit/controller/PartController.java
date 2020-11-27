package in.nit.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import in.nit.model.Part;
import in.nit.model.Uom;
import in.nit.service.IPartService;
import in.nit.service.IUomService;
import in.nit.util.CommonUtil;
import in.nit.util.PartUtil;
import in.nit.view.PartExcelView;
import in.nit.view.PartPdfView;

@Controller
@RequestMapping("/part")
public class PartController {
	
	@Autowired
	private IUomService UomService;
	
	@Autowired
	private ServletContext context;
	@Autowired
	private PartUtil util;
	
	private void commonUI(Model map) {
		List<Uom> uomList = UomService.getAllUoms();
		map.addAttribute("uomList",uomList);
		
		List<Object[]> umList = UomService.getUomIdAndUomModel();
		Map<Integer, String> uomMap =CommonUtil.convert(umList);
		map.addAttribute("uomMap", uomMap);
		
	}
	/**
	 * 1.This method is used to display
	 * Part Register Page
	 * On URL :/register, GET
	 */
	@RequestMapping("/register")//GET
	public String showReqPage(@ModelAttribute Part Part,
			Model model) {
		model.addAttribute("Part",new Part());
		commonUI(model);
		return "PartRegister" ;
		
	}
	@Autowired
	private IPartService service;
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveShipment(
			@ModelAttribute Part Part, Model model ) {
				Integer id =service.savePart(Part);
				String message = "Part '"+ id+ "'saved";
				model.addAttribute("message", message);
				model.addAttribute("Part",new Part());
				commonUI(model);
				return "PartRegister";
	}
	
	
	@RequestMapping("/all") //GET
	public String getAllPart(Model model) {
		List<Part> list = service.getAllPart();
		System.out.println(list);
		model.addAttribute("list", list);
		return "PartData";
	}
	
	@RequestMapping("/delete")
	public String deletePart(
			@RequestParam("sid")Integer id, Model model) {
		service.deletePart(id);
		String message = "Shipment'"+id+"'Deleted";
		model.addAttribute("message",message);
		List<Part> list = service.getAllPart();
		model.addAttribute("list", list);
		return "PartData";
	}
	
	@RequestMapping("/edit")
	private String ShowEditPage(
			@RequestParam("sid")Integer id , Model model) {
	Part st =service.getOnePart(id);
	model.addAttribute("Part",st);
	return "PartEdit";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String updatePart(Part Part, Model model) {
		service.updatePart(Part);
		String message="Part'"+Part.getId()+"'Updated";
		model.addAttribute("message", message);
		List<Part> list = service.getAllPart();
		model.addAttribute("list", list);
		return "PartData";
	}
	
	@RequestMapping("/view")
	public String showOneShipment(
			@RequestParam("sid")Integer id, Model model) {
		Part st = service.getOnePart(id);
		model.addAttribute("ob", st);
		return "PartView";
	}
	
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value = "id", required = false)Integer sid) {
		ModelAndView m=new ModelAndView();
		m.setView(new PartExcelView());
		
		if(sid==null) {
			//export all rows
			List<Part> list = service.getAllPart();
			m.addObject("list",list);	
		}else {
		//export one row by id
			Part st =service.getOnePart(sid);
			m.addObject("list", Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value = "id", required = false)Integer id) {
		ModelAndView m= new ModelAndView();
		m.setView(new PartPdfView());
		if(id==null) {
			//export all rows
		List<Part> list = service.getAllPart();
		//send data to pdf file
		m.addObject("list",list);
		}else {
			//show one row by id
			Part st = service.getOnePart(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	@RequestMapping("/charts")
	public String showCharts() {
		List<Object[]> list = service.getPartModeCount();
		String path = context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "PartCharts";
	}
}
