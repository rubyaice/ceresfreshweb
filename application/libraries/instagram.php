<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class instagram {

    public function __construct(){ 

        $this->ci =& get_instance();
    }

    //metodo que retorna las imagenes de instagram segun el usuario definido que inicia sesion. tomar en cuat eel token que esta definido en las paginas: para obtner el token: https://instagram.pixelunion.net/ | para obtener el user_id: https://codeofaninja.com/tools/find-instagram-user-id
    public function getImages( $limit ){

        $user_id = '8614250953';
        $access_token  = '8614250953.1677ed0.858a90c7a2e54c6fabfc9fcf06ed42a5';
        $item_resource = 'userid';
        $hashtag = '';
        $limit = $limit;

        if (!$user_id || !$access_token) {

            echo '<p class="alert alert-warning">NO HAY INFORMACIÓN COMPLETA</p>';
            return;

        }

        if( $item_resource == 'hashtag' && $hashtag) {

            $api = "https://api.instagram.com/v1/tags/". $hashtag  ."/media/recent/?access_token=" . $access_token . "&count=". $limit;

        } else {

            $api = "https://api.instagram.com/v1/users/". $user_id  ."/media/recent/?access_token=" . $access_token . "&count=". $limit;

        }

        if( ini_get('allow_url_fopen') ) {

            $images = @file_get_contents($api);
            @file_put_contents($cache_file, $images, LOCK_EX);

        } else {

            $images = curl($api);
        }

        $json = json_decode($images);

        if(isset($json->data)) {
            
            return $json->data;
        }
        
        return array();

    }
	
    /*public function curl($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }​*/
}