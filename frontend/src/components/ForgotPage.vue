<template>
  <div class="container bg-dash p-5 mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h2 class="mb-4 text-center text-decoration-underline fw-bolder">Forgot Password</h2>
        <form @submit.prevent="resetPassword">
          <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control " v-model="email" required />
          </div>
          <div class="row-c p-4">
            <button type="submit" class="btn btn-lg btn-outline-info px-5">
              Get Password Reset Link
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
  
<script>
import axios from "axios";

export default {
  name: "ForgotPassword",
  data() {
    return {
      email: "",
    };
  },
  methods: {
    async resetPassword() {
      try {
        const response = await axios.post("http://localhost:8085/forgotpassword", { email: this.email });

        // Assuming a successful response
        alert(response.data);
      } catch (error) {
        console.error("Reset password error:", error);
        // Handle other errors if needed
      }
    },
  },
};
</script>
  
<style scoped>
@import "/src/style.css";
</style>
  