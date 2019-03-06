package by.krot.mvc.dao;

import by.krot.mvc.entity.User;

import java.util.List;

public interface UserDao {

    List<User> findAll();

}
