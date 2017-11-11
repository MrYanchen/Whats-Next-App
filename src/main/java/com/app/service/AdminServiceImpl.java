package com.app.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.AdminDAO;
import com.app.hibnate.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	@Qualifier("adminHibernateDAOImpl")
	private AdminDAO adminDAO;
	
	@Override
	@Transactional
	public void addAdmin(Admin admin) {
		adminDAO.addAdmin(admin);
	}

	@Override
	@Transactional
	public Collection<Admin> listAdmins() {
		return adminDAO.listAdmins();
	}

	@Override
	@Transactional
	public Admin getAdmin(Integer id) {
		return adminDAO.getAdmin(id);
	}

	@Override
	@Transactional
	public void deleteAdmin(Integer id) {
		adminDAO.deleteAdmin(id);
	}

	@Override
	public Admin getAdmin(String name) {
		return adminDAO.getAdmin(name);
	}
}
