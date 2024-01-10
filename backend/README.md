# Spring Boot Registration, Login, Forgot Password, Reset Password REST API

A Spring Boot project implementing registration, login, forgot password, and reset password functionalities using Spring Security.

## Technologies Used

- Spring Boot 3.2.0
- Spring Web
- Lombok
- MySQL Driver
- Spring Data JPA
- Spring Security
- Java Mail Sender
- commons-codec
- commons-lang3 (org.apache.commons)
- jjwt (io.jsonwebtoken)

## Getting Started

To create the project, follow these steps:

1. Go to [https://start.spring.io/](https://start.spring.io/) and generate a project with the following settings:
   - Project: Maven
   - Language: Java
   - Spring Boot: 3.2.0
   - Dependencies: Java Mail Sender, Spring Web, Spring Security, Dev Tools, MySQL Driver, Spring Data JPA add other dependancies mannually

## Database Setup

Configure the MySQL database connection in the `application.properties file.

create the database your_database

```properties
# Data source properties
spring.datasource.url=jdbc:mysql://localhost:3306/your_database
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true


## Email Setup

Configure the email connection in the application.properties file.

# Email properties
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=your_email
spring.mail.password=your_email_password
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.mail.smtp.starttls.required=true
