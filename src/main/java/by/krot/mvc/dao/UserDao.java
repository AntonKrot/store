package by.krot.mvc.dao;

import by.krot.mvc.entity.User;

import java.util.List;

public interface UserDao {

    User findById(String id);

    User findByName(String username);

    void saveUser(User user);

    void updateUser(User user);

    void deleteById(String id);

    List<User> findAll();

    void deleteAllUsers();

    boolean isUserExist(User user);

}
