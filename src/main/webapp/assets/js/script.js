$(function() {
    $('#main-nav, #secondary-nav').find('a[href="' + location.pathname + '"]').addClass('active');
});

function mettiNelCarrello() {
    $(".acquista").on('click', function() {

        var order = JSON.parse(sessionStorage.getItem("order"));

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

        sessionStorage.setItem("order", order);

        refreshCart();

    });
}

function refreshCart() {
    var cart = JSON.parse(sessionStorage.getItem("order"));
    $("#currentCart").html("");
    var tot = 0;
    for (product in cart) {
        orderLine = cart[product];
        $("#currentCart").vprintf("<li><h4><a href='#'>%s</a><span class='quantity'>(%d)</span><span class='price'>&euro; %1$f</span><a class='destroy' href='#'><i class='fa fa-trash-o'></i></a></h4><p class='desc'>%s</p></li>",
            [orderLine.name,  orderLine.quantity, orderLine.quantity * orderLine.price, orderLine.description]);
        tot += orderLine.price * orderLine.quantity;
    }
    $("#totalCart").html("TOT: &euro; " + tot);
}

function svuotaCarrello() {
    $("#svuotaCarrello").on("click", function() {
        sessionStorage.removeItem("order");
        refreshCart();
    });
}

refreshCart();

$(document).ready(function() {
    refreshCart();
    mettiNelCarrello();
    svuotaCarrello();
});