<?php
    include("partials/header.html");
    include("partials/navbar.html");
    $url = "https://daw-danteflores.c9users.io/DAW/DanteMaxF/public/"; //Route to the REST web service
    $c = curl_init($url);
    $response = curl_exec($c);
    curl_close($c);
    //var_dump($response); 
    include("partials/footer.html");
?>