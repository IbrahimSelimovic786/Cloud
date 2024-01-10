package com.springjwt.controllers;

import com.springjwt.dto.ForgotPasswordRequest;
import com.springjwt.entities.User;
import com.springjwt.services.UserService;
import com.springjwt.services.auth.AuthServiceImpl;
import com.springjwt.util.Utility;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@RestController

public class ForgotPasswordController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private AuthServiceImpl authService; // Assuming you have UserDao class

    @PostMapping("/forgotpassword")
    public ResponseEntity<Map<String, String>> processForgetPasswordForm(
            @RequestBody ForgotPasswordRequest forgotPasswordRequest,
            HttpServletRequest request) {
        Map<String, String> response = new HashMap<>();

        String email = forgotPasswordRequest.getEmail();
        String token = DigestUtils.sha256Hex(email) + RandomStringUtils.randomAlphanumeric(30);

        try {
            authService.updateResetPasswordToken(token, email);

            // generate reset password link
            String resetPasswordLink = "http://localhost:8080" + "/reset_password?token=" + token;
            System.out.println(resetPasswordLink);

            // send email
            sendEmail(email, resetPasswordLink);

            // alert message to tell mail sent
            response.put("message", "We have sent the email. Please check.");

            System.out.println("Received email parameter: " + email);

        } catch (UsernameNotFoundException e) {
            response.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        } catch (UnsupportedEncodingException | MessagingException e) {
            response.put("error", "Error while sending email");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }

        return ResponseEntity.ok(response);
    }

    @GetMapping("/reset_password")
    public ResponseEntity<Map<String, String>> showResetPasswordForm(@RequestParam(value = "token") String token) {
        Map<String, String> response = new HashMap<>();
        User user = authService.getByResetPasswordToken(token);

        if (user == null) {
            response.put("title", "Reset your password");
            response.put("message", "Invalid Token");
            return ResponseEntity.ok(response);
        }

        response.put("token", token);
        response.put("pageTitle", "Reset your password");
        return ResponseEntity.ok(response);
    }

    @PostMapping("/reset_password")
    public ResponseEntity<Map<String, String>> processResetPassword(@RequestParam String token, @RequestParam String password) {
        Map<String, String> response = new HashMap<>();
        User user = authService.getByResetPasswordToken(token);

        if (user == null) {
            response.put("title", "Reset your Password");
            response.put("message", "Invalid token");
            return ResponseEntity.ok(response);
        }
           else {
                authService.updatePassword(user, password);
                response.put("title", "Reset password successful");
                response.put("message", "Password reset successful");
                return ResponseEntity.ok(response);
            }
    }

    // Helper method to send email
    private void sendEmail(String email, String resetPasswordLink) throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("AjayGowlikar@gmail.com", "Support");
        helper.setTo(email);

        String subject = "Here Is the link to reset the password";
        String content = "<p>Hello</p> +" +
                "<p>You have requested to reset your password</p>" +
                "<p>Click on below link to change your password : </p>" +
                "<p><b>" + resetPasswordLink + "</b></p>" +
                "<p>Ignore if not requested</p>";
        helper.setSubject(subject);
        helper.setText(content, true);

        mailSender.send(message);
    }
}

