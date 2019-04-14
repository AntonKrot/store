package by.krot.mvc.service;

import by.krot.mvc.model.OrderStatus;

import java.util.List;

public interface OrderStatusService {

    List<OrderStatus> findAllStatus();

    OrderStatus findStatusById(Long id);

}
