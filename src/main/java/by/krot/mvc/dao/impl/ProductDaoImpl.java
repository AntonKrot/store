package by.krot.mvc.dao.impl;

import by.krot.mvc.dao.CategoryDao;
import by.krot.mvc.dao.ProductDao;
import by.krot.mvc.dao.ProductStatusDao;
import by.krot.mvc.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Component
@Transactional(readOnly = true)
public class ProductDaoImpl implements ProductDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    ProductStatusDao productStatusDao;

    @Autowired
    CategoryDao categoryDao;

    @Override
    @Transactional
    public void save(Product product) {
        entityManager.persist(product);
    }

    @Override
    @Transactional
    public void update(Product product) {
        entityManager.merge(product);
    }

    @Override
    public Product findOne(Long id) {
        TypedQuery<Product> q = entityManager.createQuery("SELECT p FROM Product p WHERE p.id = :id",
                Product.class);
        q.setParameter("id", id);
        return q.getResultList().stream().findAny().orElse(null);
    }

    @Override
    public List<Product> findAll() {
        TypedQuery<Product> q = entityManager.createQuery("SELECT p FROM Product p",
                Product.class);
        return q.getResultList();
    }

    @Override
    public List<Product> findAllByStatusIdAndCategoryId(Long statusId, Long categoryId) {
        TypedQuery<Product> q = entityManager.createQuery("SELECT p FROM Product p  WHERE p.status = ?1 AND p.category = ?2",
                Product.class);
        q.setParameter(1, productStatusDao.getOne(statusId));
        q.setParameter(2, categoryDao.findOne(categoryId));
        return q.getResultList();
    }
}
