package by.krot.mvc.service;

import by.krot.mvc.model.Category;

import java.util.List;

public interface CategoryService {

    List<Category> findAllCategory();

    Category findCategoryById(Long id);

    void updateCategory(Category category);

    void deleteCategoryById(Long id);

    void addCategory(Category category);

}
