package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface ResturantDAO {

    void addRestaurant(Restaurant restaurant);

    Restaurant getRestaurant(int restaurantId);

    void UpdateRestaurant(Restaurant restaurant);

    void deleteRestaurant(int restaurantId);

    List<Restaurant> getAllRestaurant();
}