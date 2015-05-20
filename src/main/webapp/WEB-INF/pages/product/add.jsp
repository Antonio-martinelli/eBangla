<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Aggiungi prodotto</jsp:attribute>


    <jsp:attribute name="head">
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="yeld">

        <form:form id="form-data" method="post" action="/product" commandName="product">

            <form:label path="name">Nome prodotto</form:label>
            <form:input path="name"/>

            <form:label path="description">Descrizione</form:label>
            <form:input path="description"/>

            <form:label path="price">Prezzo</form:label>
            <form:input path="price"/>

            <form:label path="quantity">Quantit&agrave;</form:label>
            <form:input path="quantity"/>

            <input type="submit" value="inserisci prodotto">

        </form:form>

        <c:if test="${!empty products}">
            <h3>Prodotti</h3>
            <table id="products">
                <thead>
                <tr>
                    <th>Nome prodotto</th>
                    <th>Descrizione</th>
                    <th>Prezzo</th>
                    <th>Quantit&agrave;</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>${product.quantity}</td>
                        <td>
                            <form action="product/delete/${product.id}" method="post"><input type="submit" value="Rimuovi"/></form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </jsp:attribute>

    <jsp:attribute name="footer">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#products').DataTable({
                    "language": {
                        "url": "http://cdn.datatables.net/plug-ins/1.10.7/i18n/Italian.json"
                    }
                });
            });
        </script>
    </jsp:attribute>

</t:layout>
