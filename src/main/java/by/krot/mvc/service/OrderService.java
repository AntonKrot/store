package by.krot.mvc.service;

import by.krot.mvc.model.Order;

import java.util.List;

public interface OrderService {

    Order findOrderByStatusAndUserId(Long id, Long uid);

    Order findOrderById(Long id);

    List<Order> findAllUserOrders(Long id);

    void addOrder(Order order);

    void updateOrder(Order order);

    List<Order> findAllOrdersByStatus(Long id);
}
