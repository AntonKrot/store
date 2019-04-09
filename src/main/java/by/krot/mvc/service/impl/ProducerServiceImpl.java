package by.krot.mvc.service.impl;

import by.krot.mvc.dao.ProducerDao;
import by.krot.mvc.model.Producer;
import by.krot.mvc.service.ProducerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProducerServiceImpl implements ProducerService {

    @Autowired
    ProducerDao producerDao;

    @Override
    public void addProducer(Producer producer) {
        producerDao.save(producer);
    }

    @Override
    public void updateProducer(Producer producer) {
        producerDao.save(producer);
    }

    @Override
    public List<Producer> findAllProducers() {
        return producerDao.findAll();
    }

    @Override
    public Producer findProducerById(Long id) {
        return producerDao.findOne(id);
    }

    @Override
    public void deleteProducerById(Long id) {
        producerDao.delete(id);
    }
}
