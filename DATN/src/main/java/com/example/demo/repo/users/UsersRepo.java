package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UsersRepo extends JpaRepository<Users, UUID> {

    @Query("select p from Users p where p.email= ?1 and  p.matKhau= ?2")
    Users findByEmailAndMatKhau(String email, String matKhau);

    @Query("select p from Users p where p.ma= ?1")
    Users findByMa(String ma);

    @Query("select p from Users p where p.email= ?1")
    Users findByEmail(String email);
}
