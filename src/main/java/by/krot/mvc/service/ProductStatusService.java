package by.krot.mvc.service;

import by.krot.mvc.model.ProductStatus;

import java.util.List;

public interface ProductStatusService {

    List<ProductStatus> findAllStatus();

    ProductStatus findStatusById(Long id);


}
