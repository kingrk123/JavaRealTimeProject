package in.nit.controller;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.nit.model.WhUserType;
import in.nit.service.IWhUserTypeService;
import in.nit.util.WhUserTypeUtil;
import in.nit.validator.WhUserTypeValidator;

/**
 * @author:ranvi 
 *  
 */
@Controller
@RequestMapping("/whusertype")
public class WhUserTypeController {

	@Autowired
	private WhUserTypeValidator validator;
	
	@Autowired
	private ServletContext context;
	@Autowired
	private WhUserTypeUtil util;
	
	@Autowired
	private IWhUserTypeService service;

	
	@RequestMapping("/register")
	public String regWhUserType(ModelMap map) {
		map.addAttribute("whusertype",new WhUserType());
		return "WhUserTypeRegister1";
	}

	@RequestMapping(
			value = "/save",
			method = POST
			)
	public String saveWhUserType(
			@ModelAttribute WhUserType whusertype,
			Errors errors,
			ModelMap map) {
		validator.validate(whusertype, errors);
		
		if(!errors.hasErrors()) {
			Integer id=service.saveWhUserType(whusertype);
			map.addAttribute("message","WhUserType created with Id:"+id);
			map.addAttribute("whusertype",new WhUserType()) ;
		}else {
			map.addAttribute("message","Please Check All Errors");
		}
		return "WhUserTypeRegister1";
	}

	@RequestMapping(
			value = "/update",
			method = POST
			)
	public String updateWhUserType(@ModelAttribute WhUserType whusertype, ModelMap map) {
		service.updateWhUserType(whusertype);
		map.addAttribute("message","WhUserType updated");
		List<WhUserType> list=service.getAllWhUserTypes();
		map.addAttribute("list",list);
		return "WhUserTypeData";
	}

	@RequestMapping("/delete")
	public String deleteWhUserType(@RequestParam Integer id, ModelMap map) {
		service.deleteWhUserType(id);
		map.addAttribute("message","WhUserType deleted with Id:"+id);
		List<WhUserType> list=service.getAllWhUserTypes();
		map.addAttribute("list",list);
		return "WhUserTypeData";
	}

	@RequestMapping("/edit")
	public String editWhUserType(@RequestParam Integer id, ModelMap map) {
		WhUserType ob=service.getOneWhUserType(id);
		map.addAttribute("whusertype",ob);
		return "WhUserTypeEdit";
	}

	@RequestMapping("/all")
	public String getAllWhUserTypes(ModelMap map) {
		List<WhUserType> list=service.getAllWhUserTypes();
		map.addAttribute("list",list);
		System.out.println(list.toString());
		return "WhUserTypeData";
	}
	
	@RequestMapping("/charts")
	public String showCharts() {
		List<Object[]> list = service.getWhUserTypeModeCount();
		String path = context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "WhUserTypeCharts";
	}
}
