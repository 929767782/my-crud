package com.llp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llp.bean.Department;
import com.llp.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	//查询所有社团
	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}
}
