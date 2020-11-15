<?php

function cekLogin(){
    $ini = get_instance();
    if (!$ini->session->userdata('email')) {
        redirect('login');
    } else {
       
    }
}

function cekPenjual(){
    $ini = get_instance();
    if ($ini->session->userdata('role') == 2) {
        redirect('dashboard');
    } else {
       
    }
}
function cekPEmbeli(){
    $ini = get_instance();
    if ($ini->session->userdata('role') == 3) {
        redirect('dashboard');
    } else {
       
    }
}

// function cekAdmin(){
//     $ini = get_instance();
//     $ini->load->library('fungsi');
//     if ($ini->fungsi->_login()->level != 1) {
//         redirect('dashborad');
//     }
// }