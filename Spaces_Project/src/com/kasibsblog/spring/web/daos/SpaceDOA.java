package com.kasibsblog.spring.web.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("spacedoa")
public class SpaceDOA {

	private NamedParameterJdbcTemplate dataSource;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = new NamedParameterJdbcTemplate(dataSource);
	}

	public boolean createSpace(Space space) {
		BeanPropertySqlParameterSource props = new BeanPropertySqlParameterSource(space);

		return dataSource.update("insert into space(name,street,city,state,country,contact) "
				+ "values(:name,:street,:city,:state,:country,:contact)", props) == 1;
	}

	@Transactional
	public int[] createSpaces(List<Space> space) {
		SqlParameterSource[] props = SqlParameterSourceUtils.createBatch(space.toArray());

		return dataSource.batchUpdate("insert into space(id,name,street,city,state,country,contact) "
				+ "values(:id,:name,:street,:city,:state,:country,:contact)", props);
	}

	public boolean updateSpace(Space space) {
		BeanPropertySqlParameterSource props = new BeanPropertySqlParameterSource(space);

		return dataSource.update("update space set name=:name, street=:street, city=:city,"
				+ " state=:state, country=:country, contact=:contact where id=:id", props) == 1;
	}

	public List<Space> getSpace() {
		return dataSource.query("select * from space", new RowMapper<Space>() {

			public Space mapRow(ResultSet rs, int rowNum) throws SQLException {
				Space space = new Space();

				space.setId(rs.getInt("id"));
				space.setName(rs.getString("name"));
				space.setStreet(rs.getString("street"));
				space.setCity(rs.getString("city"));
				space.setState(rs.getString("state"));
				space.setCountry(rs.getString("country"));
				space.setContact(rs.getString("contact"));

				return space;
			}

		});

	}

	public Space getSpaceByName(String name) {

		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("name", name);

		return dataSource.queryForObject("select * from space where name=:name", parameters, new RowMapper<Space>() {

			public Space mapRow(ResultSet rs, int rowNum) throws SQLException {
				Space space = new Space();

				space.setId(rs.getInt("id"));
				space.setName(rs.getString("name"));
				space.setStreet(rs.getString("street"));
				space.setCity(rs.getString("city"));
				space.setState(rs.getString("state"));
				space.setCountry(rs.getString("country"));
				space.setContact(rs.getString("contact"));

				return space;
			}

		});

	}

	public List<Space> getSpace(String username) {

		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("username", username);

		return dataSource.query("select * from space where username=:username", parameters, new RowMapper<Space>() {

			public Space mapRow(ResultSet rs, int rowNum) throws SQLException {
				Space space = new Space();

				space.setId(rs.getInt("id"));
				space.setName(rs.getString("name"));
				space.setStreet(rs.getString("street"));
				space.setCity(rs.getString("city"));
				space.setState(rs.getString("state"));
				space.setCountry(rs.getString("country"));
				space.setContact(rs.getString("contact"));

				return space;
			}

		});

	}

	public void delete(int id) {

		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("id", id);

		dataSource.update("delete from space where id=:id", parameters);
	}

	public Space getSpaceById(int id) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);

		return dataSource.queryForObject("select * from space where id=:id", params, new RowMapper<Space>() {

			@Override
			public Space mapRow(ResultSet rs, int rowNum) throws SQLException {
				Space space = new Space();

				space.setId(rs.getInt("id"));
				space.setName(rs.getString("name"));
				space.setStreet(rs.getString("street"));
				space.setCity(rs.getString("city"));
				space.setState(rs.getString("state"));
				space.setCountry(rs.getString("country"));
				space.setContact(rs.getString("contact"));

				return space;
			}
		});

	}

}
