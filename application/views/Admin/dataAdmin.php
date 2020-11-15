        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800"><?= $tittle ?></h1>
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <a href="<?= base_url('admin/add')?>" class="btn btn-success mb-3" ><i class="fa fa-fw fa-user-plus"></i> add</a>
              <div class="table-responsive">
              <table class="table table-bordered" id="table_id" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th style="width: 10px;">No</th>
                <th>Nama</th>
                <th>Alamat</th>
                <th>Role</th>
                <th>User Active</th>
                <th>Created</th>
                <th>Action</th>
              </tr>
            </thead>
            
            <tbody>
              <?php 
              $no = 1;
              foreach($admins as $u){ 
              ?>
              <tr>
                <td><?php echo $no++ ?></td>
                <td><?php echo $u->name ?></td>
                <td><?php echo $u->email ?></td>
                <td><?php echo $u->name_role ?></td>
                <td><?php echo $u->is_active ?></td>
                <td><?php echo date('d F Y', $u->date_created) ?></td>
                <td>
                      <?php echo anchor('crud/edit/'.$u->user_id,'Edit'); ?>
                                        <?php echo anchor('crud/hapus/'.$u->user_id,'Hapus'); ?>
                </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
              </div>
            </div>
          </div>

          
        </div>
