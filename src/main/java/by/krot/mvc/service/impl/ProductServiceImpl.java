package by.krot.mvc.service.impl;

import by.krot.mvc.dao.ProductDao;
import by.krot.mvc.model.Category;
import by.krot.mvc.model.Producer;
import by.krot.mvc.model.Product;
import by.krot.mvc.service.CategoryService;
import by.krot.mvc.service.ProducerService;
import by.krot.mvc.service.ProductService;
import by.krot.mvc.service.ProductStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductStatusService productStatusService;

    @Autowired
    ProducerService producerService;

    @Autowired
    CategoryService categoryService;

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
    public List<Product> findAllProducts() {
        return productDao.findAll();
    }

    @Override
    public void updateProduct(Product product) {
        productDao.update(product);
    }

    @Override
    public List<Product> findAllByStatusIdAndCategoryId(Long statusId, Long categoryId) {
        return productDao.findAllByStatusIdAndCategoryId(statusId, categoryId);
    }

    @Override
    public Product getProduct(Product product, Long idStatus, Long idCategory, Long idProducer, MultipartFile file) {
        try {
            byte[] bytes = file.getBytes();
            product.setPicture(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        product.setStatus(productStatusService.findStatusById(idStatus));
        product.setProducer(producerService.findProducerById(idProducer));
        product.setCategory(categoryService.findCategoryById(idCategory));
        return product;
    }
}
