package by.krot.mvc.config;


import by.krot.mvc.dao.UserDao;
import by.krot.mvc.dao.UserDaoImpl;
import by.krot.mvc.services.UserService;
import by.krot.mvc.services.UserServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;

@Configuration
public class SpringConfig {

    @Bean
    public JdbcTemplate getJdbcTemplate() {
        return new JdbcTemplate(getDataSource());
    }

    @Bean
    public DataSource getDataSource() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/store");
        driverManagerDataSource.setUsername("root");
        driverManagerDataSource.setPassword("root");
        driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        return driverManagerDataSource;
    }

    @Bean
    public UserDao getUserDao() {
        return new UserDaoImpl(getJdbcTemplate());
    }

    @Bean
    public UserService getUserService() {
        return new UserServiceImpl();
    }
}
