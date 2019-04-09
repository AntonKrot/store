package by.krot.mvc.dao;

import by.krot.mvc.model.Producer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProducerDao extends JpaRepository<Producer, Long> {
}
