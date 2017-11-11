package com.app.service;

import java.util.Collection;

import com.app.hibnate.Step;

public interface StepService 
{
	public void addStep(Step step);
	public Collection<Step> listSteps();
	public Step getStep(int stepID);
	public void deleteStep(int stepID);
	public Collection<Step> listStepsByItemId(Integer itemID);
	public Collection<Step> relistStep(Integer itemID);
}
