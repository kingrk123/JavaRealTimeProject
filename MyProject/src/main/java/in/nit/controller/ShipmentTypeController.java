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
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.ShipmentType;
import in.nit.service.IShipmentTypeService;
import in.nit.util.ShipmentTypeUtil;
import in.nit.validator.ShipmentTypeValidator;
import in.nit.view.ShipmentTypeExcelView;
import in.nit.view.ShipmentTypePdfView;

@Controller
@RequestMapping("/shipment")
public class ShipmentTypeController {
	
	@Autowired
	private ServletContext context;
	@Autowired
	private ShipmentTypeUtil util;
	@Autowired
	private ShipmentTypeValidator validator;
	/**
	 * 1.This method is used to display
	 * shipmentType Register Page
	 * On URL :/register, GET
	 */
	@RequestMapping("/register")//GET
	public String showReqPage(@ModelAttribute ShipmentType shipmentType,
			Model model) {
		model.addAttribute("shipmentType",new ShipmentType());
		return "ShipmentTypeRegister" ;
		
	}
	@Autowired
	private IShipmentTypeService service;
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveShipment(
			@ModelAttribute ShipmentType shipmentType, 
			Errors errors,
			Model model ) {
			validator.validate(shipmentType, errors);
			if(!errors.hasErrors()) {
				Integer id =service.saveShipmentType(shipmentType);
				String message = "Shipment Type '"+ id+ "'saved";
				model.addAttribute("message", message);
				model.addAttribute("shipmentType",new ShipmentType());
			}else {
				model.addAttribute("message","Please Check All Errors");
			}
				return "ShipmentTypeRegister";
	}
	
	
	@RequestMapping("/all") //GET
	public String getAllShipmentType(Model model) {
		List<ShipmentType> list = service.getAllShipmentTypes();
		System.out.println(list);
		model.addAttribute("list", list);
		return "ShipmentTypeData";
	}
	
	@RequestMapping("/delete")
	public String deleteShipmentType(
			@RequestParam("sid")Integer id, Model model) {
		service.deleteShipmentType(id);
		String message = "Shipment'"+id+"'Deleted";
		model.addAttribute("message",message);
		List<ShipmentType> list = service.getAllShipmentTypes();
		model.addAttribute("list", list);
		return "ShipmentTypeData";
	}
	
	@RequestMapping("/edit")
	private String ShowEditPage(
			@RequestParam("sid")Integer id , Model model) {
	ShipmentType st =service.getOneShipmentType(id);
	model.addAttribute("shipmentType",st);
	return "ShipmentTypeEdit";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String updateShipmentType(ShipmentType shipmentType, Model model) {
		service.updateShipmentType(shipmentType);
		String message="ShipmentType'"+shipmentType.getShipId()+"'Updated";
		model.addAttribute("message", message);
		List<ShipmentType> list = service.getAllShipmentTypes();
		model.addAttribute("list", list);
		return "ShipmentTypeData";
	}
	
	@RequestMapping("/view")
	public String showOneShipment(
			@RequestParam("sid")Integer id, Model model) {
		ShipmentType st = service.getOneShipmentType(id);
		model.addAttribute("ob", st);
		return "ShipmentTypeView";
	}
	
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value = "id", required = false)Integer sid) {
		ModelAndView m=new ModelAndView();
		m.setView(new ShipmentTypeExcelView());
		
		if(sid==null) {
			//export all rows
			List<ShipmentType> list = service.getAllShipmentTypes();
			m.addObject("list",list);	
		}else {
		//export one row by id
			ShipmentType st =service.getOneShipmentType(sid);
			m.addObject("list", Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value = "id", required = false)Integer id) {
		ModelAndView m= new ModelAndView();
		m.setView(new ShipmentTypePdfView());
		if(id==null) {
			//export all rows
		List<ShipmentType> list = service.getAllShipmentTypes();
		//send data to pdf file
		m.addObject("list",list);
		}else {
			//show one row by id
			ShipmentType st = service.getOneShipmentType(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/charts")
	public String showCharts() {
		List<Object[]> list = service.getShipmentModeCount();
		String path = context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "ShipmentTypeCharts";
	}
}
