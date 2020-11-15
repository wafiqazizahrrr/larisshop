<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function index()
	{
		$data =[
			'title' => 'Laris - Toko Sepatu',
			'produk' => $this->m_produk->allProduk(),
			'user' => $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array(),
		];

		$this->load->view('templates/pubHead', $data);
		$this->load->view('vdashboard', $data);
		$this->load->view('templates/pubfoot');
	}
}
