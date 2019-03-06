package by.krot.mvc.services;

import by.krot.mvc.entity.User;

import java.util.List;

public interface UserService {

    User findById(String id);

    User findByName(String name);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserBuId(String id);

    List<User> findAll();

    void deleteAllUsers();

    boolean isUserExist(User user);



}
