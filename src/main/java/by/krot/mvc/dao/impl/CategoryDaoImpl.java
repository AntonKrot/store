package by.krot.mvc.dao.impl;

import by.krot.mvc.dao.CategoryDao;
import by.krot.mvc.model.Category;
import by.krot.mvc.model.CategoryStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Component
@Transactional(readOnly = true)
public class CategoryDaoImpl implements CategoryDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Category> findAll() {
        TypedQuery<Category> q = entityManager.createQuery("SELECT c FROM Category c",
                Category.class);
        return q.getResultList();
    }

    @Override
    public Category findOne(Long id) {
        TypedQuery<Category> q = entityManager.createQuery("SELECT c FROM Category c WHERE c.id = :id",
                Category.class);
        q.setParameter("id", id);
        return q.getResultList().stream().findAny().orElse(null);
    }

    @Override
    public void update(Category category) {
        entityManager.merge(category);
    }

    @Override
    public void save(Category category) {
        entityManager.persist(category);
    }

    @Override
    public List<Category> findAllByStatus(CategoryStatus categoryStatus) {
        TypedQuery<Category> q = entityManager.createQuery("SELECT c FROM Category c WHERE c.status = :status",
                Category.class);
        q.setParameter("status", categoryStatus);
        return q.getResultList();
    }
}
