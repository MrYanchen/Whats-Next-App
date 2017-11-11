package com.app.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Step;

@Repository
public class StepHibernateDAOImpl implements StepDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addStep(Step step) {
		sessionFactory.getCurrentSession().saveOrUpdate(step);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void updateStep(Step step) {
		sessionFactory.getCurrentSession().update(step);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Step> listSteps() {
		return sessionFactory.getCurrentSession().createQuery("from Step").list();
	}

	@Override
	public Step getStep(int stepID) {
		return (Step)sessionFactory.getCurrentSession().get(Step.class, stepID);
	}

	@Override
	public void deleteStep(int stepID) {
		Step step = getStep(stepID);
		if (step != null){
			sessionFactory.getCurrentSession().delete(step);
			sessionFactory.getCurrentSession().flush();
		}
	}

	@Override
	public Collection<Step> listStepsByItemId(Integer id) {
		return sessionFactory.getCurrentSession().createQuery("from Step " + "where ItemId =:ItemId").setParameter("ItemId", id).list();
	}

}
