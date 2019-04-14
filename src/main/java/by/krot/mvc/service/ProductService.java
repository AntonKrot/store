package by.krot.mvc.service;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.Producer;
import by.krot.mvc.model.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {

    void addProduct(Product product);

    Product findProductById(Long id);

    List<Product> findAllProducts();

    void updateProduct(Product product);

    List<Product> findAllByStatusIdAndCategoryId(Long statusId, Long categoryId);

    Product getProduct(Product product, Long statusId, Long categoryId, Long producerId, MultipartFile file);

}
