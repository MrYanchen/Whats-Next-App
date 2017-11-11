package com.app.service;

import java.util.Collection;

import com.app.hibnate.Register;

public interface RegisterService 
{
	public void addRegister(Register register);
	public void updateRegister(Register register);
	public Collection<Register> listRegisters();
	public Collection<Register> listRegistersApply();
	public Register getRegister(Integer registerId);
	public Register getRegister(String name);
	public void deleteRegister(Integer registerId);
	public Collection<Register> SearchRegisters(String Name) ;
}
