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

}
