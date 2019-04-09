package by.krot.mvc.service.impl;

import by.krot.mvc.dao.OrderDao;
import by.krot.mvc.model.Order;
import by.krot.mvc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    @Override
    public Order findOrderByStatusAndUserId(Long id, Long uid) {
        return orderDao.findOrderByStatusAndUserId(id, uid);
    }

    @Override
    public Order findOrderById(Long id) {
        return orderDao.findOrderById(id);
    }

    @Override
    public List<Order> findAllUserOrders(Long id) {
        return orderDao.findAllUserOrders(id);
    }

    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }

    @Override
    public void updateOrder(Order order) {
        orderDao.updateOrder(order);
    }

    @Override
    public List<Order> findAllOrdersByStatus(Long id) {
        List<Order> orders =orderDao.findAllOrdersByStatus(id);
        return orders;
    }
}


