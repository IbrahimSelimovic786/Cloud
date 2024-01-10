package com.springjwt.repositories;

import com.springjwt.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findFirstByEmail(String email);

    User findByEmail(String email);

    User findByResetPasswordToken(String token);
}
