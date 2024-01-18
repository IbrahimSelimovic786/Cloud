<template>
  <div>
    <div class="container text-center bg-dash">
      <div>
        <h2>User Details</h2>
        <p>Name: {{ user.name }}</p>
        <p>Email: {{ user.email }}</p>
        <p>Phone: {{ user.phone }}</p>
        <p>Gender: {{ user.gender }}</p>
      </div>
    </div>
    <!-- UPGARDE TO PRO -->

    <div class="banner col-pro-banner col p-5 text-center">
      <h1>want more features?</h1>
      <div class="d-grid col-1 mx-auto">
        <button class="btn btn-outline-info" type="button">Get Pro</button>
      </div>
    </div>

    <!-- BANNER  -->

    <div class="hero-banner ">
      <div class="container p-5">
        <!-- Your hero banner content goes here -->
        <h1 class="display-4 text-capitalize">
          Welcome to the place where you get great Services
        </h1>
        <p class="lead text-capitalize">Your stisfication is our Happiness.</p>
      </div>
    </div>

    <!-- CURRENT EXPENSE  -->

    <div class="row m-2">
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <div class="row">
            <div class="col-9">
              <div class="d-flex align-items-center align-self-start">
                <h3 class="mb-0">$17.34</h3>
                <p class="text-success ms-2 mb-0 font-weight-medium">+11%</p>
              </div>
            </div>
            <div class="col-3">
              <div class="icon icon-box-success p-1">
                <span class="mdi mdi-arrow-top-right icon-item"></span>
              </div>
            </div>
          </div>
          <h6 class="muted font-weight-normal">Revenue current</h6>
        </div>
      </div>
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <div class="row">
            <div class="col-9">
              <div class="d-flex align-items-center align-self-start">
                <h3 class="mb-0">$17.34</h3>
                <p class="text-success ms-2 mb-0 font-weight-medium">+11%</p>
              </div>
            </div>
            <div class="col-3">
              <div class="icon icon-box-success p-1">
                <span class="mdi mdi-arrow-top-right icon-item"></span>
              </div>
            </div>
          </div>
          <h6 class="muted font-weight-normal">Revenue current</h6>
        </div>
      </div>
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="row">
          <div class="col-9">
            <div class="d-flex align-items-center align-self-start">
              <h3 class="mb-0">$12.34</h3>
              <p class="text-danger ms-2 mb-0 font-weight-medium">-2.4%</p>
            </div>
          </div>
          <div class="col-3">
            <div class="icon icon-box-danger p-1">
              <span class="mdi mdi-arrow-bottom-left icon-item"></span>
            </div>
          </div>
          <h6 class="muted font-weight-normal">Revenue current</h6>
        </div>
      </div>
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <div class="row">
            <div class="col-9">
              <div class="d-flex align-items-center align-self-start">
                <h3 class="mb-0">$17.34</h3>
                <p class="text-success ms-2 mb-0 font-weight-medium">+11%</p>
              </div>
            </div>
            <div class="col-3">
              <div class="icon icon-box-success ">
                <span class="mdi mdi-arrow-top-right icon-item"></span>
              </div>
            </div>
          </div>
          <h6 class="muted font-weight-normal">Revenue current</h6>
        </div>
      </div>
    </div>

    <!-- OUR SERVICES  -->

    <div class="row m-2">
      <div class="col-md-4 p-4 center col-sm-12 m-2 bg-dash">
        <div>
          <img src="../img/img-1.png" alt="" />
        </div>
        <div class="text-center p-2">
          <div class="row">
            <div class="col text-right">
              <h6 class="mb-1">Transfer to Paypal</h6>
              <p class="muted mb-0">07 Jan 2019, 09:12AM</p>
            </div>
            <div class="col">
              <h6 class="font-weight-bold mb-0 text-left">$236</h6>
            </div>
          </div>
        </div>
        <div class="text-center p-2">
          <div class="row">
            <div class="col text-right">
              <h6 class="mb-1">Transfer to Paypal</h6>
              <p class="muted mb-0">07 Jan 2019, 09:12AM</p>
            </div>
            <div class="col">
              <h6 class="font-weight-bold mb-0 text-left">$236</h6>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md center bg-dash m-2 col-sm-12">
        <div class="col-12">
          <div>
            <div class="container-1">
              <div class="left-section">
                <div class="preview-icon bg-primary icon-service">
                  <i class="mdi mdi-file-document"></i>
                </div>
                <div class="text-section">
                  <div class="bold-text">Admin dashboard design</div>
                  <div class="muted-text">Broadcast web app mockup with class muted</div>
                </div>
              </div>
              <div class="right-section">
                <div class="time-text">15 minutes ago</div>
                <div class="task-text">30 tasks, 5 issues</div>
              </div>
            </div>
          </div>
          <div class="container-1">
            <div class="left-section">
              <div class="preview-icon bg-success icon-service">
                <i class="mdi mdi-cloud-download"></i>
              </div>
              <div class="text-section">
                <div class="bold-text">Admin dashboard design</div>
                <div class="muted-text">Broadcast web app mockup with class muted</div>
              </div>
            </div>
            <div class="right-section">
              <div class="time-text">15 minutes ago</div>
              <div class="task-text">30 tasks, 5 issues</div>
            </div>
          </div>
          <div class="container-1">
            <div class="left-section">
              <div class="preview-icon bg-info icon-service">
                <i class="mdi mdi-clock"></i>
              </div>
              <div class="text-section">
                <div class="bold-text">Admin dashboard design</div>
                <div class="muted-text">Broadcast web app mockup with class muted</div>
              </div>
            </div>
            <div class="right-section">
              <div class="time-text">15 minutes ago</div>
              <div class="task-text">30 tasks, 5 issues</div>
            </div>
          </div>
          <div class="container-1">
            <div class="left-section">
              <div class="preview-icon bg-danger icon-service">
                <i class="mdi mdi-email-open"></i>
              </div>
              <div class="text-section">
                <div class="bold-text">Admin dashboard design</div>
                <div class="muted-text">Broadcast web app mockup with class muted</div>
              </div>
            </div>
            <div class="right-section">
              <div class="time-text">15 minutes ago</div>
              <div class="task-text">30 tasks, 5 issues</div>
            </div>
          </div>
          <div class="container-1">
            <div class="left-section">
              <div class="preview-icon bg-warning icon-service">
                <i class="mdi mdi-chart-pie"></i>
              </div>
              <div class="text-section">
                <div class="bold-text">Admin dashboard design</div>
                <div class="muted-text">Broadcast web app mockup with class muted</div>
              </div>
            </div>
            <div class="right-section">
              <div class="time-text">15 minutes ago</div>
              <div class="task-text">30 tasks, 5 issues</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- OUR SALE  -->


    <div class="row m-2">
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <h5>Revenue</h5>
          <div class="row">
            <div class="col-8 col-sm-12 col-xl-8 my-auto">
              <div class="d-flex d-sm-block d-md-flex align-items-center">
                <h2 class="mb-0">$32123</h2>
                <p class="text-success ml-2 mb-0 font-weight-medium">+3.5%</p>
              </div>
              <h6 class="muted font-weight-normal">
                11.38% Since last month
              </h6>
            </div>
            <div class="col-4 col-sm-12 icon-service-sale col-xl-4  text-center text-xl-right">
              <i class="icon-lg  mdi mdi-codepen text-primary ml-auto"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <h5>Sales</h5>
          <div class="row">
            <div class="col-8 col-sm-12 col-xl-8 my-auto">
              <div class="d-flex d-sm-block d-md-flex align-items-center">
                <h2 class="mb-0">$45850</h2>
                <p class="text-success ml-2 mb-0 font-weight-medium">+8.3%</p>
              </div>
              <h6 class="muted font-weight-normal">
                9.61% Since last month
              </h6>
            </div>
            <div class="col-4 col-sm-12 col-xl-4 icon-service-sale text-center text-xl-right">
              <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
            </div>
          </div>
        </div>
      </div>
      <div class="col col-md p-5 m-2 bg-dash">
        <div class="card-body">
          <h5>Sales</h5>
          <div class="row">
            <div class="col-8 col-sm-12 col-xl-8 my-auto">
              <div class="d-flex d-sm-block d-md-flex align-items-center">
                <h2 class="mb-0">$45850</h2>
                <p class="text-success ml-2 mb-0 font-weight-medium">+8.3%</p>
              </div>
              <h6 class="muted font-weight-normal">
                9.61% Since last month
              </h6>
            </div>
            <div class="col-4 col-sm-12 col-xl-4 icon-service-sale text-center text-xl-right">
              <i class="icon-lg mdi mdi-wallet-travel text-danger ml-auto"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- REVIEW  -->

    <div class="row m-2">
      <div class="col col-md col-sm-12 p-5 m-2 bg-dash">
        <div class="card-body">
          <div class="d-flex flex-row justify-content-between">
            <h4 class="card-title">Messages</h4>
            <p class="text-muted mb-1 small">View all</p>
          </div>
          <div class="preview-list">
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <img height="35px" width="35px" src="../img/face-1.jpg" alt="face" class="rounded-circle my-2" />
              </div>
              <div class="preview-item-content d-flex flex-grow">
                <div class="flex-grow">
                  <div class="d-flex d-md-block d-xl-flex justify-content-between">
                    <h6 class="preview-subject">Leonard</h6>
                  </div>
                  <p class="muted">Well, it seems to be working now.</p>
                </div>
              </div>
            </div>
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <img height="35px" width="35px" src="../img/face-2.jpg" alt="face" class="rounded-circle my-2" />
              </div>
              <div class="preview-item-content d-flex flex-grow">
                <div class="flex-grow">
                  <div class="d-flex d-md-block d-xl-flex justify-content-between">
                    <h6 class="preview-subject">Luella Mills</h6>
                  </div>
                  <p class="muted">Well, it seems to be working now.</p>
                </div>
              </div>
            </div>
            <div class="preview-item border-bottom">
              <div class="preview-thumbnail">
                <img height="35px" width="35px" src="../img/face-3.jpg" alt="face" class="rounded-circle my-2" />
              </div>
              <div class="preview-item-content d-flex flex-grow">
                <div class="flex-grow">
                  <div class="d-flex d-md-block d-xl-flex justify-content-between">
                    <h6 class="preview-subject">Ethel Kelly</h6>
                  </div>
                  <p class="muted">Please review the tickets</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col col-md col-sm-12  p-3 m-2 bg-dash">
        <div class="card-body">
          <h4 class="card-title p-3">Our Happy Clients</h4>
          <div class="card" style="width: auto">
            <img src="../img/clints.jpg" class="card-img-top" alt="Happy clints" />
            <div class="card-body bg-dash">
              <p>
                "Grateful for our clients who paint our success with smiles. Your
                happiness is our constant inspiration, thank you for choosing us."
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="col col-md col-sm-12 col-xs-12 p-5 m-2 bg-dash">
        <div class="card-body">
          <h4 class="card-title p-2">To do list</h4>
          <form class="add-items d-flex p-2">
            <input type="text" class="form-control h-auto" placeholder="What do you need to do today?" required=""
              value="" /><button type="submit" class="btn btn-primary">Add</button>
          </form>
          <div class="list-wrapper">
            <ul class="d-flex flex-column todo-list">
              <li>
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" /> Pick up kids from
                    school <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
              <li class="completed">
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" checked="" /> Prepare
                    for presentation <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
              <li>
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" /> Print Statements
                    <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
              <li>
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" /> Create invoice
                    <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
              <li class="completed">
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" checked="" /> Call
                    John <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
              <li>
                <div class="form-check">
                  <label for="" class="form-check-label"><input class="checkbox" type="checkbox" /> Meeting with Alisa
                    <i class="input-helper"></i></label>
                </div>
                <i class="remove mdi mdi-close-box"></i>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- SERVICE ACCROSS GLOBE -->
    <div class="bg-dash p-5 m-3 text-center">
      <div class="row">
        <div class="col bg-dash">
          <div class="table-responsive">
            <h1>Our Service Accross the Globe!!!</h1>
            <h2>
              thank you for all the support form the all the customers accross the
              Globe!
            </h2>
            <img class="container" style="height: 300px; width: auto;" src="../img/globe-1.jpg" alt="" />
          </div>
        </div>
      </div>
    </div>

    <!-- FOOTER   -->
    <div class="container-fluid my-1">
      <!-- Footer -->
      <footer class="text-center text-lg-start text-white bg-dash">
        <!-- Section: Social media -->
        <section class="d-flex justify-content-between p-4" style="background-color: #6351ce">
          <!-- Left -->
          <div class="text-center me-5">
            <span>Get connected with us on social networks:</span>
          </div>
          <!-- Left -->

          <!-- Right -->
          <div>
            <a href="" class="text-white me-4">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="text-white me-4">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="text-white me-4">
              <i class="fab fa-google"></i>
            </a>
            <a href="" class="text-white me-4">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="text-white me-4">
              <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="text-white me-4">
              <i class="fab fa-github"></i>
            </a>
          </div>
          <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
          <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
              <!-- Grid column -->
              <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                <!-- Content -->
                <h6 class="text-uppercase fw-bold">Company name</h6>
                <hr class="mb-4 mt-0 d-inline-block mx-auto"
                  style="width: 60px; background-color: #7c4dff; height: 2px" />
                <p>
                  Here you can use rows and columns to organize your footer
                  content. Lorem ipsum dolor sit amet, consectetur adipisicing
                  elit.
                </p>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold">Products</h6>
                <hr class="mb-4 mt-0 d-inline-block mx-auto"
                  style="width: 60px; background-color: #7c4dff; height: 2px" />
                <p>
                  <a href="#!" class="text-white">MDBootstrap</a>
                </p>
                <p>
                  <a href="#!" class="text-white">MDWordPress</a>
                </p>
                <p>
                  <a href="#!" class="text-white">BrandFlow</a>
                </p>
                <p>
                  <a href="#!" class="text-white">Bootstrap Angular</a>
                </p>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold">Useful links</h6>
                <hr class="mb-4 mt-0 d-inline-block mx-auto"
                  style="width: 60px; background-color: #7c4dff; height: 2px" />
                <p>
                  <a href="#!" class="text-white">Your Account</a>
                </p>
                <p>
                  <a href="#!" class="text-white">Become an Affiliate</a>
                </p>
                <p>
                  <a href="#!" class="text-white">Shipping Rates</a>
                </p>
                <p>
                  <a href="#!" class="text-white">Help</a>
                </p>
              </div>
              <!-- Grid column -->

              <!-- Grid column -->
              <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                <!-- Links -->
                <h6 class="text-uppercase fw-bold">Contact</h6>
                <hr class="mb-4 mt-0 d-inline-block mx-auto"
                  style="width: 60px; background-color: #341e6e; height: 2px" />
                <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                <p><i class="fas fa-envelope mr-3"></i> info@example.com</p>
                <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
              </div>
              <!-- Grid column -->
            </div>
            <!-- Grid row -->
          </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
          © 2020 Copyright:
          <a class="text-white" href="https://google.com/">google.com</a>
        </div>
        <!-- Copyright -->
      </footer>
      <!-- Footer -->
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "DashboardPage",
  data() {
    return {
      user: {},
    };
  },
  created() {
    axios.get('http://localhost:8085/api/hii', {
      headers: {
        Authorization: `Bearer ${localStorage.getItem('jwtToken')}`,
      },
    })
      .then((response) => {
        this.user = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import "/src/style.css";
</style>
