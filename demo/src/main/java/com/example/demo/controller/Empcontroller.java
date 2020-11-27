package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.model.Employee;
import com.example.demo.service.EmployeeService;

@Controller
public class Empcontroller {

	@Autowired
	private EmployeeService service;
	
	
	//@RequestMapping("/show")
	public String showData(Model m) {
		List<Employee> list = service.getAllData();
		m.addAttribute("li", list);
		return "Emp";
	}

}
