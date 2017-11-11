package com.app.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.ItemDAO;
import com.app.hibnate.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	@Qualifier("itemHibernateDAOImpl")
	private ItemDAO itemDAO;
	
	@Override
	@Transactional
	public void addItem(Item item) {
		itemDAO.addItem(item);
	}

	@Override
	@Transactional
	public Collection<Item> listItems() {
		return itemDAO.listItems();
	}

	@Override
	@Transactional
	public Item getItem(Integer id) {
		return itemDAO.getItem(id);
	}

	@Override
	@Transactional
	public void deleteItem(Integer id) {
		itemDAO.deleteItem(id);
	}

	@Override
	@Transactional
	public void updateItem(Item item) {
		itemDAO.updateItem(item);
	}

	@Override
	@Transactional
	public Collection<Item> listItemsByUserID(Integer id) {
		return itemDAO.listItemsByUserID(id);
	}

	@Override
	@Transactional
	public void likeItem(Integer id) {
		Item item = getItem(id);
		Integer i = item.getItemLike();
		i = i + 1;
		item.setItemLike(i);
		updateItem(item);
	}

	@Override
	@Transactional
	public Collection<Item> searchItems(String content) {
		return itemDAO.searchItems(content);
	}

	@Override
	@Transactional
	public Collection<Item> listItemsByRecommendID(int id) {
		return itemDAO.listItemsByRecommendID(id);
	}

}
