package com.app.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.app.dao.StepDAO;
import com.app.hibnate.Step;

@Service
public class StepServiceImpl implements StepService {

	@Autowired
	@Qualifier("stepHibernateDAOImpl")
	private StepDAO stepDAO;
	
	@Override
	public void addStep(Step step) {
		stepDAO.addStep(step);
	}

	@Override
	public Collection<Step> listSteps() {
		return stepDAO.listSteps();
	}

	@Override
	public Step getStep(int stepID) {
		return stepDAO.getStep(stepID);
	}

	@Override
	public void deleteStep(int stepID) {
		stepDAO.deleteStep(stepID);
	}

	@Override
	public Collection<Step> listStepsByItemId(Integer itemID) {
		return stepDAO.listStepsByItemId(itemID);
	}

	@Override
	public Collection<Step> relistStep(Integer itemID) {
		ArrayList<Step> stepList = new ArrayList<Step>();
		ArrayList<Step> stepReList = (ArrayList<Step>) listStepsByItemId(itemID);
		ListIterator<Step> litr = stepReList.listIterator();
		while (litr.hasNext()) {
			Step element = litr.next();
		    litr.set(element);
		}
		while (litr.hasPrevious()) {
			Step element = litr.previous();
			stepList.add(element);
		}
		return stepList;
	}

}
