package by.krot.mvc.service;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.Producer;
import by.krot.mvc.model.Product;

import java.util.List;

public interface ProductService {

    void addProduct(Product product, Category category, Producer producer);

    Product findProductById(Long id);

    List findAllProducts();

    void deleteProductById(Long id);

    void updateProduct(Product product);

}
