package by.krot.mvc.dao;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.CategoryStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryDao {

    List<Category> findAll();

    Category findOne(Long id);

    void update(Category category);

    void save(Category category);

    List<Category> findAllByStatus(CategoryStatus categoryStatus);

}
