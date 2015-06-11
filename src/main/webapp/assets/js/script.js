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
    localStorage.removeItem("order");
    refreshCart();
}

refreshCart();

$("#confermaOrdine").on("click", function() {
    var json = {
        creationDate: new Date(),
        orderLines: []
    };

    var order = JSON.parse(localStorage.getItem("order"));
    for(product in order) {
        json.orderLines.push({
            product: {id: order[product].id},
            quantity: order[product].quantity,
            price: order[product].price
        });
    }
    localStorage.setItem("json", JSON.stringify(json));
    $.ajax({
        type: "POST",
        url: "/customer/order",
        data: {json: localStorage.getItem("json")},
        success: function() {
            svuotaCarrello();
            alert("Ordine confermato correttamente.");
        }
    });
});

$(document).ready(function() {
    refreshCart();
    mettiNelCarrello();
    $("#svuotaCarrello").on("click", function() {
        svuotaCarrello();
    });
});