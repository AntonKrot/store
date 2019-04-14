package by.krot.mvc.service;

import by.krot.mvc.model.Category;
import by.krot.mvc.model.CategoryStatus;

import java.util.List;

public interface CategoryService {

    List<Category> findAllCategory();

    Category findCategoryById(Long id);

    void updateCategory(Category category);

    void addCategory(Category category);

    List<Category> findAllByStatus(CategoryStatus categoryStatus);

}
