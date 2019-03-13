package by.krot.mvc.services;

import by.krot.mvc.dao.UserDao;
import by.krot.mvc.dao.UserDaoImpl;
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
        return null;
    }

    @Override
    public User findByName(String name) {
        return null;
    }

    @Override
    public void saveUser(User user) {

    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public void deleteUserBuId(String id) {

    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void deleteAllUsers() {

    }

    @Override
    public boolean isUserExist(User user) {
        return false;
    }
}
