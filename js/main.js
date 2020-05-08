$("#item-menu-postres").click(function(e){
    e.preventDefault;
    fetch("Postres/postres.html")
    //Haces a la informacion html
    .then(function(response){
        return response.text();
    })
    .then(function(datoshtml){
        //console.log(datoshtml);
        $("#main-content").html(datoshtml);
        //En main se reemplaze como contenido html

    })
})


$("#item-menu-contactenos").click(function(e){
    e.preventDefault;
    fetch("contactenos.html")
    .then(function(response){
        return response.text();
    })
    .then(function(datoshtml){
        $("#main-content").html(datoshtml)
    })
})