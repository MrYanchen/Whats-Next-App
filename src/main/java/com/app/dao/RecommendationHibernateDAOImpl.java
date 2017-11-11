package com.app.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Recom;

@Repository
public class RecommendationHibernateDAOImpl implements RecommendationDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addRecommendation(Recom recommendation) {
		sessionFactory.getCurrentSession().saveOrUpdate(recommendation);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void updateRecommendation(Recom recommendation) {
		sessionFactory.getCurrentSession().update(recommendation);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Recom> listRecommendations() {
		return sessionFactory.getCurrentSession().createQuery("from Recom").list();
	}

	@Override
	public Recom getRecommendation(Integer id) {
		return (Recom) sessionFactory.getCurrentSession().get(Recom.class, id);
	}

	@Override
	public void deleteRecommendation(Integer id) {
		Recom recommendation = getRecommendation(id);
		if (recommendation != null) {
			sessionFactory.getCurrentSession().delete(recommendation);
			sessionFactory.getCurrentSession().flush();
		}
	}

}
