package com.app.service;

import java.util.Collection;

import com.app.hibnate.Admin;

public interface AdminService {
	public void addAdmin(Admin admin);
	public Collection<Admin> listAdmins();
	public Admin getAdmin(Integer id);
	public Admin getAdmin(String name);
	public void deleteAdmin(Integer id);
}
