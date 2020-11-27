package in.nit.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import in.nit.model.SaleOrder;
import in.nit.service.ISaleOrderService;
import in.nit.util.SaleOrderUtil;
import in.nit.view.SaleOrderExcelView;
import in.nit.view.SaleOrderPdfView;

@Controller
@RequestMapping("/sale")
public class SaleOrderController {
	
	@Autowired
	private ServletContext context;
	@Autowired
	private SaleOrderUtil util;
	/**
	 * 1.This method is used to display
	 * SaleOrder Register Page
	 * On URL :/register, GET
	 */
	@RequestMapping("/register")//GET
	public String showReqPage(@ModelAttribute SaleOrder SaleOrder,
			Model model) {
		model.addAttribute("SaleOrder",new SaleOrder());
		return "SaleOrderRegister" ;
		
	}
	@Autowired
	private ISaleOrderService service;
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveShipment(
			@ModelAttribute SaleOrder SaleOrder, Model model ) {
				Integer id =service.saveSaleOrder(SaleOrder);
				String message = "SALE ORDER '"+ id+ "'saved";
				model.addAttribute("message", message);
				model.addAttribute("SaleOrder",new SaleOrder());
				return "SaleOrderRegister";
	}
	
	
	@RequestMapping("/all") //GET
	public String getAllSaleOrder(Model model) {
		List<SaleOrder> list = service.getAllSaleOrders();
		System.out.println(list);
		model.addAttribute("list", list);
		return "SaleOrderData";
	}
	
	@RequestMapping("/delete")
	public String deleteSaleOrder(
			@RequestParam("sid")Integer id, Model model) {
		service.deleteSaleOrder(id);
		String message = "Shipment'"+id+"'Deleted";
		model.addAttribute("message",message);
		List<SaleOrder> list = service.getAllSaleOrders();
		model.addAttribute("list", list);
		return "SaleOrderData";
	}
	
	@RequestMapping("/edit")
	private String ShowEditPage(
			@RequestParam("sid")Integer id , Model model) {
	SaleOrder st =service.getOneSaleOrder(id);
	model.addAttribute("SaleOrder",st);
	return "SaleOrderEdit";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String updateSaleOrder(SaleOrder SaleOrder, Model model) {
		service.updateSaleOrder(SaleOrder);
		String message="SaleOrder'"+SaleOrder.getSaleId()+"'Updated";
		model.addAttribute("message", message);
		List<SaleOrder> list = service.getAllSaleOrders();
		model.addAttribute("list", list);
		return "SaleOrderData";
	}
	
	@RequestMapping("/view")
	public String showOneShipment(
			@RequestParam("sid")Integer id, Model model) {
		SaleOrder st = service.getOneSaleOrder(id);
		model.addAttribute("ob", st);
		return "SaleOrderView";
	}
	
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value = "id", required = false)Integer sid) {
		ModelAndView m=new ModelAndView();
		m.setView(new SaleOrderExcelView());
		
		if(sid==null) {
			//export all rows
			List<SaleOrder> list = service.getAllSaleOrders();
			m.addObject("list",list);	
		}else {
		//export one row by id
			SaleOrder st =service.getOneSaleOrder(sid);
			m.addObject("list", Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value = "id", required = false)Integer id) {
		ModelAndView m= new ModelAndView();
		m.setView(new SaleOrderPdfView());
		if(id==null) {
			//export all rows
		List<SaleOrder> list = service.getAllSaleOrders();
		//send data to pdf file
		m.addObject("list",list);
		}else {
			//show one row by id
			SaleOrder st = service.getOneSaleOrder(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	
	@RequestMapping("/charts")
	public String showCharts() {
		List<Object[]> list = service.getSaleOrderModeCount();
		String path = context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "SaleOrderCharts";
	}
}
