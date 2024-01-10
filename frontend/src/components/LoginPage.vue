<template>
    <div class="container mt-5 bg-dash py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4 text-center text-decoration-underline fw-bolder">Login Form</h2>
                <form @submit.prevent="loginUser">
                    <div class="mb-3">
                        <label for="email" class="form-label fw-bolder">Email:</label>
                        <input type="text" placeholder="Enter Your Email" class="form-control " v-model="loginRequest.email"
                            required />
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label fw-bolder">Password:</label>
                        <input type="password" placeholder="Enter Your Password" class="form-control"
                            v-model="loginRequest.password" required />
                    </div>

                    <div class="row-c p-4">
                        <button type="submit" value="login" class="btn btn-lg btn-outline-info px-5">
                            Login
                        </button>
                    </div>
                    <div class="row-c">
                        <h6 class="p-4">Not Yet Regestered? <router-link to="/register">Register Now</router-link></h6>
                    </div>
                    <div class="row-c">
                        <router-link to="/forgot-password">forgot password?</router-link>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "LoginPage",
    data() {
        return {
            loginRequest: {
                email: "",
                password: "",
            },
        };
    },
    methods: {
        async loginUser() {
            try {
                const response = await axios.post("http://localhost:8085/authenticate", this.loginRequest);

                if (response.status === 200) {
                    const userData = response.data;
                    localStorage.setItem('user', JSON.stringify(userData));
                    this.$router.push('/dashboard');
                } else {
                    // Handle login failure
                    // ...
                }
            } catch (error) {
                console.error("Login error:", error);
                // Handle other errors if needed
            }
        }

    }
};
</script>


<style scoped>
@import "/src/style.css";
</style>
