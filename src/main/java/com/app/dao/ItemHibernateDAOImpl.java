package com.app.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Item;

@Repository
public class ItemHibernateDAOImpl implements ItemDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addItem(Item item) {
		sessionFactory.getCurrentSession().saveOrUpdate(item);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Item> listItems() {
		return sessionFactory.getCurrentSession().createQuery("from Item").list();
	}
	
	@Override
	public Item getItem(int itemID) {
		return (Item) sessionFactory.getCurrentSession().get(Item.class, itemID);
	}

	@Override
	public void deleteItem(int itemID) {
		Item item = getItem(itemID);
		if (item != null){
			sessionFactory.getCurrentSession().delete(item);
			sessionFactory.getCurrentSession().flush();
		}
	}

	@Override
	public void updateItem(Item item) {
		sessionFactory.getCurrentSession().update(item);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Item> listItemsByUserID(int id) {
		return sessionFactory.getCurrentSession().createQuery("from Item " + "where RegisterId =:RegisterId").setParameter("RegisterId", id).list();
	}

	@Override
	public Collection<Item> searchItems(String content) {
		return sessionFactory.getCurrentSession().createQuery("from Item " + "where ItemName like :ItemName").setParameter("ItemName", "%"+content+"%").list();
	}

	@Override
	public Collection<Item> listItemsByRecommendID(int id) {
		return sessionFactory.getCurrentSession().createQuery("from Item " + "where RecommondationId =:RecommondationId").setParameter("RecommondationId", id).list();
	}

}
