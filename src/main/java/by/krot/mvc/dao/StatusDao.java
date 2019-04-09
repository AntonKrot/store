package by.krot.mvc.dao;

import by.krot.mvc.model.Status;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatusDao extends JpaRepository<Status, Long> {
}
