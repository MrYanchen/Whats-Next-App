package com.app.dao;

import java.util.Collection;

import com.app.hibnate.Item;

public interface ItemDAO {
	public void addItem(Item item);
	public void updateItem(Item item);
	public Collection<Item> listItems();
	public Item getItem(int itemID);
	public void deleteItem(int itemID);
	public Collection<Item> listItemsByUserID(int id);
	public Collection<Item> listItemsByRecommendID(int id);
	public Collection<Item> searchItems(String content);
}
