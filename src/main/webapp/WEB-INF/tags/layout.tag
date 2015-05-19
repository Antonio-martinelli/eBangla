<!doctype html>
<%@attribute name="title" fragment="true" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="yeld" fragment="true" required="true" %>
<%@attribute name="footer" fragment="true" %>

<html>
<head>
    <meta charset="utf-8">
    <title><jsp:invoke fragment="title"/></title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:invoke fragment="head"/>
</head>

<body>
    <ul>
        <li><a href="/">Lista Utenti</a></li>
        <li><a href="/supplier">Lista fornitori</a></li>
        <li><a href="/product">Lista prodotti</a></li>
        <li><a href="/product/add">Aggiungi prodotto</a></li>
    </ul>
    <jsp:invoke fragment="yeld"/>
    <jsp:invoke fragment="footer"/>
</body>
</html>