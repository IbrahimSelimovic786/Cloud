<template>
    <div class="container mt-5 bg-dash py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4 text-center text-decoration-underline fw-bolder">Registration Form</h2>
                <form @submit.prevent="saveData">

                    <div class="row">
                        <div class="col p-2 m-2">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" placeholder="Enter Your Name" class="form-control" name="name"
                                v-model="user.name" required>
                        </div>
                        <div class="col p-2 m-2">
                            <label for="username" class="form-label">Username:</label>
                            <input type="text" placeholder="Enter Your Username" class="form-control" name="username"
                                v-model="user.username" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col p-2 m-2">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" placeholder="Enter Your Email " class="form-control" name="email"
                                v-model="user.email" required>
                        </div>
                        <div class="col p-2 m-2">
                            <label for="phone" class="form-label">Phone:</label>
                            <input type="text" placeholder="Enter Your Phone number" class="form-control border-info"
                                name="phone" v-model="user.phone" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col p-2 m-2"> <label for="password" class="form-label">Password:</label>
                            <input type="password" placeholder="Enter Your password" class="form-control" name="password"
                                v-model="user.password" required>
                        </div>
                        <div class="col p-2 m-2">
                            <label for="confirmPassword" class="form-label">Confirm Password:</label>
                            <input type="password" placeholder="Comfirm Password" class="form-control"
                                v-model="confirmPassword" required />
                        </div>
                    </div>







                    <fieldset class="row-c p-4">
                        <label class="mx-3">Gender:</label>
                        <div class="grid-x align-center-middle">

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" v-model="user.gender" name="gender"
                                    id="inlineRadio1" value="male"><label class="form-check-label"
                                    for="inlineRadio1">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" v-model="user.gender" name="gender"
                                    id="inlineRadio2" value="female"><label class="form-check-label"
                                    for="inlineRadio2">Female</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" v-model="user.gender" name="gender"
                                    id="inlineRadio3" value="Not_prefered_to_say"><label class="form-check-label"
                                    for="inlineRadio3">Not prefered to
                                    say</label>

                            </div>
                        </div>
                    </fieldset>
                    <div class="row-c p-4">
                        <button type="submit" class="btn btn-outline-info btn-lg px-5">Register</button>
                    </div>
                </form>

                <div class="text-center mt-3 p-2">
                    <h6>Already Registered? <router-link to="/login" class="btn btn-link">Login Now</router-link></h6>
                </div>
            </div>
        </div>
    </div>
</template>
    
    
<script>
import axios from 'axios';

export default {
    name: "RegistrationForm",
    data() {
        return {
            result: {},
            user: {
                name: '',
                username: '',
                email: '',
                phone: '',
                password: '',
                gender: ''
            }
        };
    },
    methods: {
        saveData() {
            // Validate if passwords match
            if (this.user.password !== this.confirmPassword) {
                this.resetError = 'Passwords do not match.';
                return alert('password not match');
            }
            axios.post("http://localhost:8085/sign-up", this.user)
                .then(({ data }) => {
                    console.log(data);
                    try {
                        alert("User Registration Successfull");
                    } catch (err) {
                        alert("failed");
                    }
                })
                .catch(error => {
                    console.error('Error during registration:', error);
                    alert('Registration failed. Please try again.');
                });
        }
    }
}
</script>
    
    
    
<style>
@import "/src/style.css";
</style>
    