package com.app.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Admin;

@Repository	
public class AdminHibernateDAOImpl implements AdminDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addAdmin(Admin admin) {
		sessionFactory.getCurrentSession().saveOrUpdate(admin);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Admin> listAdmins() {
		return sessionFactory.getCurrentSession().createQuery("from Admin").list();
	}

	@Override
	public Admin getAdmin(Integer id) {
		return (Admin) sessionFactory.getCurrentSession().get(Admin.class, id);
	}

	@Override
	public void deleteAdmin(Integer id) {
		Admin admin = getAdmin(id);
		if (admin != null) {
			sessionFactory.getCurrentSession().delete(admin);
			sessionFactory.getCurrentSession().flush();
		}
	}

	@Override
	public Admin getAdmin(String name) {
		Admin admin;
		for(Admin a : listAdmins()){
			if(a.getAdminName().equals(name)){
				admin = a;
				return admin;
			}
		}
		return null;
	}
}
