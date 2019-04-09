package by.krot.mvc.service;


/**
 * Service for security.
 *
 * @author Anotn Krot
 * @version 1.0
 */

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);

    Long getCurrentUserId();
}
