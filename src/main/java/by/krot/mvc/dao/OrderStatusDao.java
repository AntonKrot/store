package by.krot.mvc.dao;

import by.krot.mvc.model.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderStatusDao extends JpaRepository<OrderStatus, Long> {
}
