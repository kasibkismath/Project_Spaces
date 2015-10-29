package com.kasibsblog.spring.web.daos;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("userdao")
public class UserDao {

	private NamedParameterJdbcTemplate dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = new NamedParameterJdbcTemplate(dataSource);
	}

	public boolean createUser(User user) {
		MapSqlParameterSource props = new MapSqlParameterSource();
		props.addValue("username", user.getUsername());
		props.addValue("email", user.getEmail());
		props.addValue("password", user.getPassword());
		props.addValue("authority", user.getAuthority());
		props.addValue("enabled", user.isEnabled());

		return dataSource.update("insert into user(username, email, password, authority, enabled) "
				+ "values(:username, :email, :password, :authority, :enabled)", props) == 1;
	}
	
	public boolean userExists(String username) {
		return dataSource.queryForObject("select count(*) from user where username=:username",
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

}
