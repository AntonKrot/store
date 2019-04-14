package by.krot.mvc.service.impl;

import by.krot.mvc.dao.ProductStatusDao;
import by.krot.mvc.model.ProductStatus;
import by.krot.mvc.service.ProductStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductStatusServiceImpl implements ProductStatusService {

    @Autowired
    ProductStatusDao productStatusDao;

    @Override
    public List<ProductStatus> findAllStatus() {
        return productStatusDao.findAll();
    }

    @Override
    public ProductStatus findStatusById(Long id) {
        return productStatusDao.getOne(id);
    }

}
