package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Employee;

public class EmployeeService {
	
	public List<Employee> getAllData(){
		return List.of(
				new Employee(10, "rk", 12.5),
				new Employee(11, "sk", 13.5),
				new Employee(12, "ak", 14.5));
	}

}
