package by.krot.mvc.service;

import by.krot.mvc.model.CategoryStatus;

import java.util.List;

public interface CategoryStatusService {

    List<CategoryStatus> findAllStatus();

    CategoryStatus findStatusById(Long id);

}
