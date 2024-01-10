<template>
  <nav class="navbar navbar-expand-lg bg-dash" data-bs-theme="dark">
    <div class="container">
      <a class="navbar-brand" href="#"><img src="../src/img/logo.webp" alt="" /></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link active" to="/dashboard">Home</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/about">About</router-link>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Services
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
        <form autocomplete="off" @submit.prevent="submitForm" class="d-flex" role="search">
          <div class="row mx-2">
            <div class="col">
              <input class="form-control autocomplete" ref="myInput" type="search" name="myCountry" placeholder="Search"
                aria-label="Search" @input="handleInput" />

            </div>
            <div class="col">
              <button type="button" class="btn btn-outline-light">Serch</button>
            </div>
          </div>

        </form>
        <div v-if="isDashboardPage" class="row">
          <div class="col p-0 mx-3">
            <img class="img-xs rounded-circle mx-1" height="40px" width="35px"
              src="https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt="profile" />
          </div>
          <div class="col p-2 mx-0">
            <div class="dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Profile
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider" />
                </li>
                <li>
                  <router-link to="/login" class="nodecoration dropdown-item">Logout</router-link>
                </li>
              </ul>
            </div>
          </div>
          <div class="col">
            <a class="btn btn-outline-light" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
              aria-controls="offcanvasExample">
              <i class="text-white fa-solid fa-bars"></i>
            </a>
          </div>
        </div>
        <div v-else>
          <div class="mx-3">
            <button type="submit" value="login" class="btn btn-outline-light">
              <router-link to="/login" class="nodecoration">Login Now</router-link>
              <!-- <a href="/login">Login Now </a> -->
            </button>
          </div>
        </div>
      </div>
    </div>
  </nav>
  <div class="offcanvas offcanvas-start bg-dash" tabindex="-1" id="offcanvasExample"
    aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title text-white" id="offcanvasExampleLabel">
        <img src="../src/img/logo.webp" alt="" />
      </h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div>
      <ul class="nav nav-pills flex-column mt-4">
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white" aria-current="page"><i class="fa-solid fa-gauge"></i><span
              class="fs-4 d-none ms-3 d-sm-inline">Dashboard</span>
          </a>
        </li>
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white" aria-current="page"><i class="fa-solid fa-house"></i><span
              class="fs-4 d-none ms-3 d-sm-inline">Home</span>
          </a>
        </li>
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white border-warning-subtle" aria-current="page"><i
              class="fs-5 fa-solid fa-border-all"></i><span class="fs-4 ms-3 d-none d-sm-inline">Articles</span>
          </a>
        </li>
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white" aria-current="page"><i class="fa-solid fa-clipboard"></i><span
              class="fs-4 ms-3 d-none d-sm-inline">products</span>
          </a>
        </li>
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white" aria-current="page"><i class="fa-solid fa-arrow-up-z-a"></i><span
              class="fs-4 d-none ms-3 d-sm-inline">Order</span>
          </a>
        </li>
        <li class="nav-item py-2 py-sm-0">
          <a href="#" class="nav-link text-white" aria-current="page"><i class="fa-solid fa-user"></i><span
              class="fs-4 d-none ms-3 d-sm-inline">Customers</span>
          </a>
        </li>
      </ul>
      <div class="dropdown open dropdown p-2">
        <button class="btn border-0 bg-dash btn-secondary text-white dropdown-toggle" type="button" id="triggerId"
          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa-solid fa-user"></i><span class="ms-2"> Yourself</span>
        </button>
        <div class="dropdown-menu" aria-labelledby="triggerId">
          <button class="dropdown-item" href="#">setting</button>
          <button class="dropdown-item disabled" href="#">profile</button>
        </div>
      </div>
    </div>
  </div>
  <router-view />
</template>

<script>
export default {
  computed: {
    isDashboardPage() {
      return this.$route.path === "/dashboard";
    },
  },
  methods: {
    handleInput() {
      this.autocomplete(this.$refs.myInput, this.countries);
    },
    autocomplete(inp, arr) {
      var currentFocus = -1;

      inp.addEventListener("input", function () {
        var a, b, i, val = this.value;
        closeAllLists();
        if (!val) {
          return false;
        }
        currentFocus = -1;
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        this.parentNode.appendChild(a);

        for (i = 0; i < arr.length; i++) {
          if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
            b = document.createElement("DIV");
            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
            b.innerHTML += arr[i].substr(val.length);
            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
            b.addEventListener("click", function () {
              inp.value = this.getElementsByTagName("input")[0].value;
              closeAllLists();
            });
            a.appendChild(b);
          }
        }
      });

      inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode === 40) {
          // Arrow down key
          currentFocus++;
          addActive(x);
        } else if (e.keyCode === 38) {
          // Arrow up key
          currentFocus--;
          addActive(x);
        } else if (e.keyCode === 13) {
          // Enter key
          e.preventDefault();
          if (currentFocus > -1) {
            if (x) x[currentFocus].click();
          }
        }
      });

      function addActive(x) {
        if (!x) return false;
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = x.length - 1;
        x[currentFocus].classList.add("autocomplete-active");
      }

      function removeActive(x) {
        for (var i = 0; i < x.length; i++) {
          x[i].classList.remove("autocomplete-active");
        }
      }

      function closeAllLists() {
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
          x[i].parentNode.removeChild(x[i]);
        }
      }

      document.addEventListener("click", function (e) {
        closeAllLists(e.target);
      });
    },

    submitForm() {
      console.log("Form submitted");
    },
  },
  data() {
    return {
      countries: [
        "Home",
        "About",
        "Services",
        "Profile",
        "want more features?",
        "Get pro",
        "Welcome To The Place Where You Get Great Services",
        "Your Stisfication Is Our Happiness",
        "Revenue current",
        "Admin dashboard design",
        "Broadcast web app mockup ",
        "Transfer to Paypal",
        "Revenue Sales",
        "Our Happy Clients",
        "Messages",
        "Leonard",
        "Luella Mills",
        "Ethel Kelly",
        "Grateful for our clients",
        "To do list",
        "Our Service Accross the Globe",
        "support",
        "customers accross the Globe",
        "Get connected with us on social",
        "networks",
        "PRODUCTS",
        "CONTACT",
      ],
    };
  },
};
</script>

<style>
@import "/src/style.css";

.nodecoration {
  text-decoration: none;
  /* Remove underline */
  color: inherit;
  /* Inherit color from parent */
}

.autocomplete-items {
  position: absolute;
  max-height: 150px;
  overflow-y: auto;
  z-index: 1000;
  background-color: #191c24;
  padding: 1em;
  text-decoration: none;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
}

.autocomplete-items div:focus,
.autocomplete-items div:hover {
  border: 1px solid #FFF;
  transition: border 0.2s ease;
  outline: none;
  /* Remove default focus outline */
}

.nodecoration {
  text-decoration: none;
  color: inherit;
}

/* Add this style to adjust the position of the dropdown relative to the input */
.autocomplete {
  position: relative;
  width: fit-content;
}
</style>
