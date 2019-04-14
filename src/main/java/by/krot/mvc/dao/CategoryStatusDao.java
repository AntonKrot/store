package by.krot.mvc.dao;

import by.krot.mvc.model.CategoryStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryStatusDao extends JpaRepository<CategoryStatus, Long> {
}
