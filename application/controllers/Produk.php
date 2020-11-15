<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("m_admin");
        cekLogin();
    }

public function detail($id)
    {
        $data = [
            'title' => 'edit produk',
            'user' => $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array(),
            'produk' => $this->m_produk->detailProduk($id),
        ];

        $this->load->view('templates/pubHead', $data);
        $this->load->view('user/detailProduk', $data);
        $this->load->view('templates/pubFoot');
    }
}