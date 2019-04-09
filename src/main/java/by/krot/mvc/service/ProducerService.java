package by.krot.mvc.service;

import by.krot.mvc.model.Producer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProducerService {

    void addProducer(Producer producer);

    void updateProducer(Producer producer);

    List<Producer> findAllProducers();

    Producer findProducerById(Long id);

    void deleteProducerById(Long id);

}
