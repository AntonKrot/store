package by.krot.mvc.service;

import by.krot.mvc.model.User;

import java.util.List;

/**
 * Service class for{@link User}
 *
 * @author Anton Krot
 * @version 1.0
 */
public interface UserService {

    void save(User user);

    User findByUsername(String Username);

    List<User> findAllUsers();

    void deleteUser(Long id);
    
    User findById(Long id);

    void updateUser(User user);

    void giveAdminRole(User user);
}
