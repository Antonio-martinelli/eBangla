$(function() {
    $('#main-nav, #secondary-nav').find('a[href="' + location.pathname + '"]').addClass('active');
});

function mettiNelCarrello() {
    $(".acquista").on('click', function() {

        var order = JSON.parse(localStorage.getItem("order"));

        if (order === null) {
            order = {};
        }

        if(order[$(this).data("id")] !== undefined) {
            if(order[$(this).data("id")].quantity >= $(this).data("quantity")) {
                alert("Non abbiamo abbastanza "+$(this).data("name")+" in magazzino.");
            } else {
                order[$(this).data("id")].quantity++;
            }
        } else {
            order[$(this).data("id")] = {
                id: $(this).data("id"),
                name: $(this).data("name"),
                description: $(this).data("description"),
                price: $(this).data("price"),
                quantity: 1
            };
        }

        order = JSON.stringify(order);

        localStorage.setItem("order", order);

        refreshCart();

    });
}

function refreshCart() {
    var cart = JSON.parse(localStorage.getItem("order"));
    $("#currentCart").html("");
    var tot = 0;
    for (product in cart) {
        orderLine = cart[product];
        $("#currentCart").append("<li><h4><a href='#'>" + orderLine.name + "</a><span class='quantity'>(" + orderLine.quantity + ")</span><span class='price'>&euro; " + orderLine.quantity * orderLine.price + "</span></h4><p class='desc'>" + orderLine.description + "</p></li>");
        tot += orderLine.price * orderLine.quantity;
    }
    $("#totalCart").html("TOT: &euro; " + tot);
}


function svuotaCarrello() {
    $("#svuotaCarrello").on("click", function() {
        localStorage.removeItem("order");
        refreshCart();
    });
}

refreshCart();

$(document).ready(function() {
    refreshCart();
    mettiNelCarrello();
    svuotaCarrello();
});