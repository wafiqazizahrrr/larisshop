<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5 col-lg-7 mx-auto">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" method="POST" action="<?= base_url('auth/register')?>"> 
                <div class="form-group">
                  <input type=text class="form-control form-control-user" name="name" id="name" placeholder="Fullname" value="<?= set_value('name') ?>">
                  <?= form_error('name', '<small class="text-danger pl-3">','</small>'); ?>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" name="email" id="email" placeholder="Email Address" value="<?= set_value('email') ?>">
                  <?= form_error('email', '<small class="text-danger pl-3">','</small>'); ?>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" name="password1" id="password1" placeholder="Password">
                  <?= form_error('password1', '<small class="text-danger pl-3">','</small>'); ?>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" name="password2" id="password2" placeholder="Repeat Password">
                  </div>
                </div>

                <div class="mb-3 mx-auto">
                  <img class="img-fluid" src="<?= base_url('assets/img/reg.png')?>" alt="">
                </div>

                <div class="form-group row">
                  <div class="col-lg">
                    <div class="form-check form-check-inline col-sm-6 ml-3">
                      <input class="form-check-input" type="radio" name="role" id="inlineRadio1" value="3">
                      <label class="form-check-label" for="inlineRadio1">Daftar Sebagai Pembeli</label>
                    </div>

                    <div class="form-check form-check-inline ml-3">
                      <input class="form-check-input" type="radio" name="role" id="inlineRadio2" value="2">
                      <label class="form-check-label" for="inlineRadio2">Daftar Sebagai Penjual</label>
                    </div>       
                  </div>         
                </div>

                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Register Account
                </button>
              </form>
              <hr>
              <!-- <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div> -->
              <div class="text-center">
                <a class="small" href="<?= base_url('')?>login">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>