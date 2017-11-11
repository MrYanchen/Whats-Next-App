package com.app.dao;

import java.util.Collection;

import com.app.hibnate.*;

public interface AdminDAO {
	public void addAdmin(Admin admin);
	public Collection<Admin> listAdmins();
	public Admin getAdmin(Integer id);
	public Admin getAdmin(String name);
	public void deleteAdmin(Integer id);
}
