package by.krot.mvc.dao;

import by.krot.mvc.model.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductStatusDao extends JpaRepository<ProductStatus, Long> {
}
