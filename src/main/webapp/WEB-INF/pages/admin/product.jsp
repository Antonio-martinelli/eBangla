<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Gestione dei prodotti</jsp:attribute>


    <jsp:attribute name="head">
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="yeld">

        <h1>Gestione dei prodotti</h1>

        <form:form id="form-data" method="post" action="/admin/product" commandName="product">

            <form:label path="name">Nome prodotto</form:label>
            <form:errors path="name"></form:errors>
            <form:input path="name"/>

            <form:label path="description">Descrizione</form:label>
            <form:errors path="description"></form:errors>
            <form:input path="description"/>

            <form:label path="price">Prezzo</form:label>
            <form:errors path="price"></form:errors>
            <form:input path="price"/>

            <form:label path="quantity">Quantit&agrave;</form:label>
            <form:errors path="quantity"></form:errors>
            <form:input path="quantity"/>

            <input type="submit" value="aggiungi prodotto">

        </form:form>

        <c:if test="${!empty products}">
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
                            <form action="/admin/product/delete/${product.id}" method="post"><input type="submit" value="Rimuovi"/></form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

    </jsp:attribute>

    <jsp:attribute name="footer">
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
