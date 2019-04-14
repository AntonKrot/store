package by.krot.mvc.service.impl;

import by.krot.mvc.dao.OrderStatusDao;
import by.krot.mvc.dao.OrderStatusDao;
import by.krot.mvc.model.OrderStatus;
import by.krot.mvc.service.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderStatusServiceImpl implements OrderStatusService {

    @Autowired
    OrderStatusDao statusDao;

    @Override
    public List<OrderStatus> findAllStatus() {
        return statusDao.findAll();
    }

    @Override
    public OrderStatus findStatusById(Long id) {
        return statusDao.findOne(id);
    }
}
