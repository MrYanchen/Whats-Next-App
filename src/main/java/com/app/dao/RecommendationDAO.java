package com.app.dao;

import java.util.Collection;

import com.app.hibnate.Recom;

public interface RecommendationDAO {
	public void addRecommendation(Recom recommendation);
	public void updateRecommendation(Recom recommendation);
	public Collection<Recom> listRecommendations();
	public Recom getRecommendation(Integer id);
	public void deleteRecommendation(Integer id);
}
