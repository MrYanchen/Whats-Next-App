package com.app.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.hibnate.Category;

@Repository
public class CategoryHibernateDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public Collection<Category> listCategorys() {
		return sessionFactory.getCurrentSession().createCriteria("from Category").list();
	}

	@Override
	public Category getCategory(Integer id) {
		return (Category) sessionFactory.getCurrentSession().get(Category.class, id);
	}

	@Override
	public void deleteCategory(Integer id) {
		Category category = getCategory(id);
		if (category != null){
			sessionFactory.getCurrentSession().delete(category);
			sessionFactory.getCurrentSession().flush();
		}
	}

	@Override
	public void updateCategory(Category category) {
		sessionFactory.getCurrentSession().update(category);
		sessionFactory.getCurrentSession().flush();
	}

}
