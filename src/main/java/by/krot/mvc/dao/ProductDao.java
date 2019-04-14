package by.krot.mvc.dao;

import by.krot.mvc.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductDao {

    void save(Product product);

    void update(Product product);

    Product findOne(Long id);

    List<Product> findAll();

    List<Product> findAllByStatusIdAndCategoryId(Long statusId, Long categoryId);

}
