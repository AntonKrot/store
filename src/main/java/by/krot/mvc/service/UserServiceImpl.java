package by.krot.mvc.service;

import by.krot.mvc.dao.UserDao;
import by.krot.mvc.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    public UserDao userDao;

    @Override
    public User findById(String id) {
        return userDao.findById(id);
    }

    @Override
    public User findByName(String username) {
        return userDao.findByName(username);
    }

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteById(String id) {
        userDao.deleteById(id);
    }


    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void deleteAllUsers() {
        userDao.deleteAllUsers();
    }

    @Override
    public boolean isUserExist(User user) {
        return userDao.isUserExist(user);
    }
}
