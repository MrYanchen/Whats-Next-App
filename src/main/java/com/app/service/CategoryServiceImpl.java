package com.app.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.CategoryDAO;
import com.app.hibnate.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	@Qualifier("categoryHibernateDAOImpl")
	private CategoryDAO categoryDAO;
	
	@Override
	@Transactional
	public void addCategory(Category category) {
		categoryDAO.addCategory(category);
	}

	@Override
	@Transactional
	public void updateCategory(Category category) {
		categoryDAO.updateCategory(category);
	}

	@Override
	@Transactional
	public Collection<Category> listCategory() {
		return categoryDAO.listCategorys();
	}

	@Override
	@Transactional
	public Category getCategory(Integer id) {
		return categoryDAO.getCategory(id);
	}

	@Override
	@Transactional
	public void deleteCategory(Integer id) {
		categoryDAO.deleteCategory(id);
	}

}
