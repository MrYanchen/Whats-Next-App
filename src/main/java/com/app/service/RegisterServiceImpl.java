package com.app.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.RegisterDAO;

import com.app.hibnate.Register;


@Service
public class RegisterServiceImpl implements RegisterService{

    @Autowired
	@Qualifier("registerHibernateDAOImpl")
	private RegisterDAO registerDAO;
	
	@Override
	@Transactional
	public void addRegister(Register register) {
		registerDAO.addRegister(register);
	}

	@Override
	@Transactional
	public Collection<Register> listRegisters() {
		return registerDAO.listRegisters();
	}

	@Override
	@Transactional
	public Register getRegister(Integer registerId) {
		return registerDAO.getRegister(registerId);
	}

	@Override
	@Transactional
	public void deleteRegister(Integer registerId) {
		registerDAO.deleteRegister(registerId);
	}
	
	@Override
	@Transactional
	public void updateRegister(Register register) {
		registerDAO.updateRegister(register);
		
	}
	
	@Override
	@Transactional
	public Collection<Register> SearchRegisters(String Name) {
		return registerDAO.SearchRegisters(Name);
	}

	@Override
	@Transactional
	public Register getRegister(String name) {
		return registerDAO.getRegister(name);
	}

	@Override
	@Transactional
	public Collection<Register> listRegistersApply() {
		return registerDAO.listRegistersApply();
	}

}
