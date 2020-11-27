package in.nit.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.Uom;
import in.nit.service.IUomService;
import in.nit.util.UomUtil;
import in.nit.validator.UomValidator;
import in.nit.view.UomExcelView;
import in.nit.view.UomPdfView;

@Controller
@RequestMapping("/uom")
public class UomController {

	@Autowired
	private UomValidator validator;
	@Autowired
	private ServletContext context;
	@Autowired
	private UomUtil util;
	/**
	 * 1.This method is used to display
	 * Uom Register Page
	 * On URL :/register, GET
	 */
	@RequestMapping("/register")//GET
	public String showReqPage(@ModelAttribute Uom Uom,
			Model model) {
		model.addAttribute("Uom",new Uom());
		return "UomRegister" ;
		
	}
	@Autowired
	private IUomService service;
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveUom(
			@ModelAttribute Uom uom,
			Errors errors,	//must be call next to modelparam
			Model map ) {
		//must be call before save
		validator.validate(uom, errors);
		if(!errors.hasErrors()) {   ///if error not exist
				Integer id =service.saveUom(uom);
				map.addAttribute("message","Uom created with Id:"+id);
				map.addAttribute("uom",new Uom()) ;
			}else { //If errors exist
				map.addAttribute("message","Please Check all Errors!");
			}
			return "UomRegister";
		}
	
	
	@RequestMapping("/all") //GET
	public String getAllUom(Model model) {
		List<Uom> list = service.getAllUoms();
		System.out.println(list);
		model.addAttribute("list", list);
		return "UomData";
	}
	
	@RequestMapping("/delete")
	public String deleteUom(
			@RequestParam("uomid")Integer id, Model model) {
		service.deleteUom(id);
		String message = "UOM'"+id+"'Deleted";
		model.addAttribute("message",message);
		List<Uom> list = service.getAllUoms();
		model.addAttribute("list", list);
		return "UomData";
	}
	
	@RequestMapping("/edit")
	private String ShowEditPage(
			@RequestParam("uomid")Integer id , Model model) {
	Uom st =service.getOneUom(id);
	model.addAttribute("Uom",st);
	return "UomEdit";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String updateUom(Uom Uom, Model model) {
		service.updateUom(Uom);
		String message="Uom'"+Uom.getUomId()+"'Updated";
		model.addAttribute("message", message);
		List<Uom> list = service.getAllUoms();
		model.addAttribute("list", list);
		return "UomData";
	}
	

	@RequestMapping("/view")
	public String showOneShipment(
			@RequestParam("uomid")Integer id, Model model) {
		Uom st = service.getOneUom(id);
		model.addAttribute("ob", st);
		return "UomView";
	}
	
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value = "id", required = false)Integer id) {
		ModelAndView m=new ModelAndView();
		m.setView(new UomExcelView());
		
		if(id==null) {
			//export all rows
			List<Uom> list = service.getAllUoms();
			m.addObject("list",list);	
		}else {
		//export one row by id
			Uom st =service.getOneUom(id);
			m.addObject("list", Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value = "id", required = false)Integer id) {
		ModelAndView m= new ModelAndView();
		m.setView(new UomPdfView());
		if(id==null) {
			//export all rows
		List<Uom> list = service.getAllUoms();
		//send data to pdf file
		m.addObject("list",list);
		}else {
			//show one row by id
			Uom st = service.getOneUom(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	@RequestMapping("/charts")
	public String showCharts() {
		List<Object[]> list = service.getUomModeCount();
		String path = context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "UomCharts";
	}
	
	@RequestMapping("/modelExist")
	public @ResponseBody String isModelExist(
			@RequestParam("model")String model
			)
	{
		String message="";
		boolean exist=service.isUomModelExist(model);
		if(exist) {
			message=model+" already exist";
		}
		return message;
	}
	

}
