package by.krot.mvc.service.impl;

import by.krot.mvc.dao.CategoryDao;
import by.krot.mvc.model.Category;
import by.krot.mvc.model.CategoryStatus;
import by.krot.mvc.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categoryDao;

    @Override
    public List<Category> findAllCategory() {
        List<Category> categories = categoryDao.findAll();
        return categories;
    }

    @Override
    public Category findCategoryById(Long id) {
        Category category = categoryDao.findOne(id);
        return category;
    }

    @Override
    public void updateCategory(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void addCategory(Category category) {
        categoryDao.save(category);
    }

    @Override
    public List<Category> findAllByStatus(CategoryStatus categoryStatus) {
        return categoryDao.findAllByStatus(categoryStatus);
    }
}
