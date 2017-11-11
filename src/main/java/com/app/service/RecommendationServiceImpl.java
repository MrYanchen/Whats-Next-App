package com.app.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.RecommendationDAO;
import com.app.hibnate.Recom;

@Service
public class RecommendationServiceImpl implements RecommendationService {

	@Autowired
	@Qualifier("recommendationHibernateDAOImpl")
	private RecommendationDAO recommendationDAO;
	
	@Override
	@Transactional
	public void addRecommendation(Recom recommendation) {
		recommendationDAO.addRecommendation(recommendation);
	}

	@Override
	@Transactional
	public void updateRecommendation(Recom recommendation) {
		recommendationDAO.updateRecommendation(recommendation);
	}

	@Override
	@Transactional
	public Collection<Recom> listRecommendations() {
		return recommendationDAO.listRecommendations();
	}

	@Override
	@Transactional
	public Recom getRecommendation(Integer id) {
		return recommendationDAO.getRecommendation(id);
	}

	@Override
	@Transactional
	public void deleteRecommendation(Integer id) {
		recommendationDAO.deleteRecommendation(id);
	}

}
