package by.krot.mvc.service.impl;

import by.krot.mvc.dao.ProductDao;
import by.krot.mvc.model.Category;
import by.krot.mvc.model.Producer;
import by.krot.mvc.model.Product;
import by.krot.mvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    EntityManager entityManager;

    @Autowired
    private ProductDao productDao;

    @Override
    public void addProduct(Product product) {
        productDao.save(product);
    }

    @Override
    public Product findProductById(Long id) {
        return productDao.findOne(id);
    }

    @Override
    public List findAllProducts() {
        return productDao.findAll();
    }

    @Override
    public void deleteProductById(Long id) {
    productDao.delete(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.save(product);
    }
}
