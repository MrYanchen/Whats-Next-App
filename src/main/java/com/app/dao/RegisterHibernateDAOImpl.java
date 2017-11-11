package com.app.dao;



import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Register;

@Repository	
public class RegisterHibernateDAOImpl implements RegisterDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addRegister(Register register) {
		sessionFactory.getCurrentSession().save(register);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Register> listRegisters()
	{
		return sessionFactory.getCurrentSession().createQuery("from Register").list();
	}

	@Override
	public Register getRegister(Integer registerId) 
	{
		return (Register) sessionFactory.getCurrentSession().get(Register.class, registerId);
	}

	@Override
	public void deleteRegister(Integer registerId) {
		Register register = getRegister(registerId);
		if (register != null) {
			sessionFactory.getCurrentSession().delete(register);
			sessionFactory.getCurrentSession().flush();
		}
	}

	@Override
	public void updateRegister(Register register) {
		sessionFactory.getCurrentSession().saveOrUpdate(register);
		sessionFactory.getCurrentSession().flush();
		
	}

	@Override
	public Collection<Register> SearchRegisters(String name) {
		return sessionFactory.getCurrentSession().createQuery("from Register "+"where Register.registerName =:registerName").setParameter("registerName", name).list();
	}

	@Override
	public Register getRegister(String name) {
		Register register;
		for(Register r : listRegisters()){
			if(r.getRegisterName().equals(name)){
				register = r;
				return register;
			}
		}
		return null;
	}

	@Override
	public Collection<Register> listRegistersApply() {
		return sessionFactory.getCurrentSession().createQuery("from Register "+"where Register.apply =:apply").setParameter("apply", true).list();
	}
}
