package com.app.service;

import java.util.Collection;

import com.app.hibnate.Item;

public interface ItemService {
	public void addItem(Item item);
	public void updateItem(Item item);
	public Collection<Item> listItems();
	public Item getItem(Integer id);
	public void deleteItem(Integer id);
	public Collection<Item> listItemsByUserID(Integer id);
	public Collection<Item> listItemsByRecommendID(int id);
	public void likeItem(Integer id);
	public Collection<Item> searchItems(String content);
}
