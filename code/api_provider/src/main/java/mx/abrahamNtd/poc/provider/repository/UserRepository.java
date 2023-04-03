package mx.abrahamNtd.poc.provider.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import mx.abrahamNtd.poc.provider.model.User;

public interface UserRepository  extends CrudRepository<User, Long>{
	List<User> findByName(String lastName);
}

