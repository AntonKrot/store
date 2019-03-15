package by.krot.mvc.dao;

import by.krot.mvc.entity.User;
import by.krot.mvc.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    public final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(sql, new UserMapper());
    }

    @Override
    public void saveUser(User user) {
        String sql = "INSERT INTO user (iduser,username, password, firstname, lastname, email, address, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getId(), user.getUsername(), user.getPassword(), user.getFirstname(), user.getLastname(), user.getEmail(), user.getAddress(), user.getPhone());
    }

    @Override
    public User findById(String id) {
        String sql = "SELECT * FROM user WHERE iduser=?";
        return jdbcTemplate.queryForObject(sql, new UserMapper(), id);
    }

    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM user WHERE iduser=?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE user SET iduser=?, username=?, password=?, firstname=?, lastname=?, email=?, address=?, phone=?";
        jdbcTemplate.update(sql, user.getId(), user.getUsername(), user.getPassword(), user.getFirstname(), user.getLastname(), user.getEmail(), user.getAddress(), user.getPhone());
    }

    @Override
    public void deleteAllUsers() {
        String sql = "DELETE * FROM user";
        jdbcTemplate.update(sql);
    }

    @Override
    public boolean isUserExist(User user) {
        return findByName(user.getUsername()) != null;
    }

    @Override
    public User findByName(String username) {
        String sql = "SELECT * FROM user WHERE username=?";
        return jdbcTemplate.queryForObject(sql, new UserMapper(), username);
    }
}
