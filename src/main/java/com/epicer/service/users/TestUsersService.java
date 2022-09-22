package com.epicer.service.users;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epicer.model.users.TestUsers;

@Service
@Transactional
public class TestUsersService {
	
	@Autowired
	private TestUsersRepository testUsersRepository;
	
	public TestUsers selectTestUersById(int id) {
		Optional<TestUsers> op = testUsersRepository.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}

}
