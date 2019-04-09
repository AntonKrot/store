package by.krot.mvc.dao.impl;

import by.krot.mvc.dao.OrderDao;
import by.krot.mvc.dao.StatusDao;
import by.krot.mvc.dao.UserDao;
import by.krot.mvc.model.Order;
import by.krot.mvc.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Component
@Transactional(readOnly = true)
public class OrderDaoImpl implements OrderDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    StatusDao statusDao;

    @Autowired
    UserDao userDao;

    @Override
    public List<Order> findAllOrdersByStatus(Long id) {
        TypedQuery<Order> q = entityManager.createQuery("SELECT o FROM Order o  where o.status = ?1",
                Order.class);
        q.setParameter(1, statusDao.getOne(id));
        return q.getResultList();
    }

    @Override
    public Order findOrderByStatusAndUserId(Long statusId, Long userId) {
        TypedQuery<Order> q = entityManager.createQuery("SELECT o FROM Order o WHERE o.status = ?1 AND o.user = ?2",
                Order.class);
        q.setParameter(1, statusDao.getOne(statusId));
        q.setParameter(2, userDao.getOne(userId));
        return q.getResultList().stream().findAny().orElse(null);
    }

    @Override
    public Order findOrderById(Long id) {
        TypedQuery<Order> q = entityManager.createQuery("SELECT o FROM Order o WHERE o.id = :id",
                Order.class);
        q.setParameter("id", id);
        return q.getResultList().stream().findAny().orElse(null);
    }

    @Override
    public List<Order> findAllUserOrders(Long userId) {
        TypedQuery<Order> q = entityManager.createQuery("SELECT o FROM Order o WHERE o.user = :user",
                Order.class);
        q.setParameter("user", userDao.getOne(userId));
        return (List<Order>) q.getResultList().stream().findAny().orElse(null);
    }

    @Override
    @Transactional
    public void addOrder(Order order) {
        entityManager.persist(order);
    }

    @Override
    @Transactional
    public void updateOrder(Order order) {
        entityManager.merge(order);
    }

    @Override
    public void deleteProductFromOrder(Long productId) {

    }

}
