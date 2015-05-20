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
                <li><a title="fornitori" href="/supplier">fornitori</a></li>
                <li><a title="prodotti" href="/product">prodotti</a></li>
                <li><a title="ordini" href="/order">ordini</a></li>
            </ul>
        </nav>
        <nav id="secondary-nav">
            <ul>
                <li><a title="registrati" href="/user">registrati</a></li>
                <li><a title="login" href="#">login</a></li>
            </ul>
        </nav>
    </header>
    <div id="wrap">
        <div id="content">
            <jsp:invoke fragment="yeld"/>
        </div>
        <div id="sidebar">
        </div>
    </div>
    <footer id="footer">
        <p>Tutti i diritti sono riservati al bangladino sotto casa sua</p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/min/script-min.js"></script>
    <jsp:invoke fragment="footer"/>

</body>
</html>
