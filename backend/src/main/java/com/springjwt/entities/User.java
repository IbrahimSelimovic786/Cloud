package com.springjwt.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "users")
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String username;

    private String email;

    private String Phone;

    private String password;

    private String gender;

    @Column(name="reset_password_token")
    private String resetPasswordToken;

}
