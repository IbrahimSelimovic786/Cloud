<template>
    <div class="container bg-dash p-5 mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4 text-center text-decoration-underline fw-bolder">Reset Password</h2>
                <form @submit.prevent="resetPassword">
                    <div v-if="message" class="alert alert-danger" role="alert">
                        {{ message }}
                    </div>

                    <div v-if="!message">
                        <div class="mb-3">
                            <label for="password" class="form-label">New Password:</label>
                            <input type="password" class="form-control" v-model="newPassword" required />
                        </div>

                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password:</label>
                            <input type="password" class="form-control" v-model="confirmPassword" required />
                        </div>

                        <div class="row-c p-4">
                            <button type="submit" class="btn btn-outline-info btn-lg px-5">Reset Password</button>
                            <div v-if="resetError" class="error-message">{{ resetError }}</div>
                            <div v-if="resetSuccess" class="success-message">{{ resetSuccess }}</div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';

export default {
    data() {
        return {
            newPassword: '',
            confirmPassword: '',
            resetError: null,
            resetSuccess: null,
            message: null, // Add this line
        };
    },
    methods: {
        async resetPassword() {
            // Validate if passwords match
            if (this.newPassword !== this.confirmPassword) {
                this.resetError = 'Passwords do not match.';
                return;
            }

            try {
                const token = this.$route.query.token;
                const url = `http://localhost:8085/reset_password?token=${token}&password=${this.newPassword}`;

                const response = await axios.post(url);

                if (response.data && response.data.message === "Password reset successful") {
                    // Handle successful password reset
                    this.resetSuccess = 'Password reset successful!';
                } else {
                    // Handle unexpected response from the server
                    this.resetError = 'Unexpected response from the server.';
                }
            } catch (error) {
                console.error('Error resetting password:', error);
                this.resetError = 'Error resetting password. Please check the console for more details.';
            }
        },
    }

};
</script>
<style>
@import "/src/style.css";

.error-message {
    color: red;
}

.success-message {
    color: green;
}
</style>
  