package by.krot.mvc.service.impl;

import by.krot.mvc.dao.StatusDao;
import by.krot.mvc.model.Status;
import by.krot.mvc.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusServiceImpl implements StatusService {

    @Autowired
    StatusDao statusDao;

    @Override
    public List<Status> findAllStatus() {
        return statusDao.findAll();
    }

    @Override
    public Status findStatusById(Long id) {
        return statusDao.findOne(id);
    }
}
