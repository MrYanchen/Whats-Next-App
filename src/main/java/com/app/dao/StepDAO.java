package com.app.dao;

import java.util.Collection;

import com.app.hibnate.Step;

public interface StepDAO {
	public void addStep(Step step);
	public void updateStep(Step step);
	public Collection<Step> listSteps();
	public Step getStep(int stepID);
	public void deleteStep(int stepID);
	public Collection<Step> listStepsByItemId(Integer id);
}
