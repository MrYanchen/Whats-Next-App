package com.app.dao;

import java.util.Collection;

import com.app.hibnate.Category;

public interface CategoryDAO {
	public void addCategory(Category category);
	public void updateCategory(Category category);
	public Collection<Category> listCategorys();
	public Category getCategory(Integer id);
	public void deleteCategory(Integer id);
}
