package by.krot.mvc.service.impl;

import by.krot.mvc.dao.CategoryStatusDao;
import by.krot.mvc.model.CategoryStatus;
import by.krot.mvc.service.CategoryStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryStatusServiceImpl implements CategoryStatusService {

    @Autowired
    CategoryStatusDao categoryStatusDao;

    @Override
    public List<CategoryStatus> findAllStatus() {
        return categoryStatusDao.findAll();
    }

    @Override
    public CategoryStatus findStatusById(Long id) {
        return categoryStatusDao.getOne(id);
    }

}
