
<div class="container-fluid my-3" >

<div class="container">

    <h2>Produk Terbaru</h2>
    <div class="row mt-4">

        <?php foreach ($produk as $i) :  ?>
            <div class="col-md-4">
                <?php 
                echo form_open('user/tambahkeranjang');
                echo form_hidden('id', $i->produk_id);
                echo form_hidden('qty', 1);
                echo form_hidden('price', $i->harga);
                echo form_hidden('name', $i->nama_produk);
                echo form_hidden('redirect_page', str_replace('index.php','',current_url()) );              
                ?>
                <a href="<?= base_url('produk/detail/').$i->produk_id?>" class="text-decoration-none text-dark">
                    <img style="width: 20rem; height:18rem" src="<?= base_url('assets/img/produk/').$i->produk_img ?>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title m-auto"><?= $i->nama_produk ?></h5>
                        <p class="card-text"><?= $i->merk ?></p> </a>
                        <h5 class="card-title mt-3"><?= 'Rp '.number_format(" $i->harga", 0, ",", "."); ?></h5>
                        <button type="submit" class="btn btn-flat btn-success">Masukkan Keranjang</button>
                        <button type="submit" class="btn btn-flat btn-primary">Detail</button>
                    </div>
                </a>
                <?= form_close();  ?>
            </div>
        <?php endforeach;  ?>
    </div>
</div>
</div>
