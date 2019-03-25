package by.krot.mvc.service;

import by.krot.mvc.model.User;

/**
 * Service class for{@link User}
 *
 * @author Anton Krot
 * @version 1.0
 */
public interface UserService {

    void save(User user);

    User findByUsername(String Username);

}
