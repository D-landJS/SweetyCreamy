var rutaCategorias = "http://localhost:8080/servicioPosteria/categorias.php"
fetch(rutaCategorias)
    //Haces a la informacion html
    .then(function (response) {
        return response.json();
    })
    .then(function (datos) {

        $(datos).each(function (index, value) {
            console.log(index);
            console.log(value);
            var fila = "<li class='list-group-item' codi='" + value.idCategoria + "'>";
            fila += "<h5>" + value.nombre + "</h5>";
            fila += "<p>" + value.descripcion + "</p>";
            fila += "</li>";

            $("#list-category").append(fila);

        })
        $("#list-category li").click(function () {
            var nombreCategoria = $(this).find("h5").text();
            $("#titulo-categoria").text(nombreCategoria);

            var descripcionCategoria = $(this).find("p").text();
            $("#descripcion-categoria").text(descripcionCategoria);

            var idcategoria = $(this).attr("codi");
            mostrarProductos(idcategoria);
        })


})


function mostrarProductos(idcategoria) {
    console.log(idcategoria);

    var rutaProductos = "http://localhost:8080/servicioPosteria/postres.php"
    var formData = new FormData();
    formData.append("idcategoria", idcategoria)

    fetch(rutaProductos,
        {
            method: "POST",
            body: formData
        })
        //Haces a la informacion html
        .then(function (response) {
            return response.json();
        })
        .then(function (datos) {
            $("#card-products").html("");
            $(datos).each(function (index, value) {

                var rutaImagen="http://localhost:8080/servicioPosteria/" +value.imagen;

                var card = '<div class="card">'
                card += '<img class="card-img-top" src="'+ rutaImagen+'" alt="Card image cap">'
                card += '<div class="card-body">'
                card += '<h5 class="card-title text-center">' + value.nombre +'</h5>'
                card += ' <p class="card-text text-center">'+ value.caracteristica +'</p>'
                card += '</div>'
                card += '<div class="card-footer">'
                card += ' <p class="text-center">S/. '+ parseFloat(value.precio).toFixed(2) +'</p>'
                card += '</div>'
                
                  
                $("#card-products").append(card);

            })

        })
}