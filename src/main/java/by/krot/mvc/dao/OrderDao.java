package by.krot.mvc.dao;

import by.krot.mvc.model.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {

    List<Order> findAllOrdersByStatus(Long id);

    Order findOrderByStatusAndUserId(Long id, Long uid);

    Order findOrderById(Long id);

    List<Order> findAllUserOrders(Long id);

    void addOrder(Order order);

    void updateOrder(Order order);

    void deleteProductFromOrder(Long productId);

}
