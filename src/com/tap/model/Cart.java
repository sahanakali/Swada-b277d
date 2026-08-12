package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    Map<Integer, Cartitem> items;

    public Cart() {
        items = new HashMap<Integer, Cartitem>();
    }

    public Map<Integer, Cartitem> getItems() {
        return items;
    }

    public void addItem(Cartitem cartitem) {

        int menuId = cartitem.getMenuId();

        if (items.containsKey(menuId)) {

            Cartitem existingCartItem = items.get(menuId);

            existingCartItem.setQty(existingCartItem.getQty() + 1);

        } else {

            items.put(menuId, cartitem);
        }
    }


	public void updateItem(int menuId, int quantity) {
		if(items.containsKey(menuId))
		{
			Cartitem cartitem = items.get(menuId);
			if(quantity < 1)
			{
				items.remove(menuId);
			}
			else
			{
				cartitem.setQty(quantity);
				items.put(menuId, cartitem);
			}
			
			
		}
		
	}

	public void remove(int menuId) {
		items.remove(menuId);
		
	}




}