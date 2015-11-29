package com.kasibsblog.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kasibsblog.spring.web.daos.Space;
import com.kasibsblog.spring.web.daos.SpaceDOA;

@Service("spaceService")
public class SpaceService {
	
	@Autowired
	private SpaceDOA spacedoa;
	
	public List<Space> getAllSpaces(){
		return spacedoa.getSpace();
	}

	public List<Space> getSpaces(String username) {
		return spacedoa.getSpace(username);
		
	}

	public void delete(int id) {
		spacedoa.delete(id);
		
	}

	public Space getSpaceById(int id) {
		return spacedoa.getSpaceById(id);
	}

	public void updateSpace(Space space) {
		spacedoa.updateSpace(space);
		
	}

	public void addSpace(Space space) {
		spacedoa.createSpace(space);
		
	}

}
