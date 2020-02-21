<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->helper('url');
		$this->load->database();
		if (!$this->session->userdata('correo_admin')) {
			redirect('admin/login');
		}

	}


	public function index()
	{

		$this->load->view('admin/header/header');
		$this->load->view('admin/mid-dashboard');
		$this->load->view('admin/footer/footer');

	}
}
