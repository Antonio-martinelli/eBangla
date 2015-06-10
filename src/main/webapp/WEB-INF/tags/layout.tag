<!doctype html>
<%@attribute name="title" fragment="true" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="yeld" fragment="true" required="true" %>
<%@attribute name="footer" fragment="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title><jsp:invoke fragment="title"/></title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/assets/css/app.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <jsp:invoke fragment="head"/>
</head>

<body>
    <header id="header">
        <h1 id="logo"><a title="homepage" href="/">eBangla</a></h1>
        <nav id="main-nav">
            <ul>
                <li><a title="homepage" href="/">home</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a title="fornitori" href="/admin/supplier">fornitori</a></li>
                    <li><a title="prodotti" href="/admin/product">prodotti</a></li>
                    <li><a title="ordini" href="/admin/order">ordini</a></li>
                    <li><a title="utenti" href="/admin/user">utenti</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <li><a title="ordini" href="/customer/order">ordini</a> </li>
                </sec:authorize>
            </ul>
        </nav>
        <nav id="secondary-nav">
            <ul>
                <li><a title="registrati" href="/signup">registrati</a></li>
                <sec:authorize access="isAnonymous()">
                    <li><a title="login" href="/login">login</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li><a href="/j_spring_security_logout">logout</a></li>
                </sec:authorize>
            </ul>
        </nav>
    </header>
    <div id="wrap">
        <div id="content">
            <jsp:invoke fragment="yeld"/>
        </div>
        <div id="sidebar">
            <sec:authorize access="isAnonymous()">
                <div class="widget">
                    <a title="registrati" href="/signup"><h3>Registrati!</h3></a>
                    <p>Sarai abilitato ad utilizzare il Carrello per ordinare i nostri fantastici Prodotti!</p>
                </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <div class="widget">
                <h3>Il tuo carrello ${sessionScope['scopedTarget.currentOrder'].id}</h3>
                <ul id="currentCart">
                </ul>
                <div class="total" id="totalCart"></div>
                <a class="btn" href="#">Conferma ordine <i class="fa fa-shopping-cart"></i></a><br/>
                <a id="svuotaCarrello" class="btn" href="#">Annulla ordine <i class="fa fa-trash"></i></a>
            </div>
            </sec:authorize>
        </div>
    </div>
    <footer id="footer">
        <p>Tutti i diritti sono riservati al bangladino sotto casa sua</p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/js/min/script-min.js"></script>
    <script type="text/javascript" src="/assets/js/min/jquery.sprintf-min.js"></script>
    <jsp:invoke fragment="footer"/>

</body>
</html>
