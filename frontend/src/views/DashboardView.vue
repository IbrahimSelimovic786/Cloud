<template>
  <div class="home">
    <Dashboard />
  </div>
</template>

<script>
// @ is an alias to /src
import Dashboard from "@/components/DashboardPage.vue";

export default {
  name: "DashboardView",
  components: {
    Dashboard,
  },
};
</script>
