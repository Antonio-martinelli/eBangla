<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Gestione degli ordini</jsp:attribute>

    <jsp:attribute name="head">
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="yeld">

        <h1>Gestione degli ordini</h1>

        <form:form id="form-data" method="post" action="/admin/order" commandName="order">
            <input type="submit" value="Evadi ordine">
        </form:form>

        <c:if test="${!empty orders}">
          <table id="test">
            <thead>
            <tr>
                <th>Creation Date</th>
                <th>Closing Date</th>
                <th>Evasion Date</th>
                <th>Cancella</th>
                <th>Evadi</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
              <tr>
                <td>${order.creationDate}</td>
                <td>${order.closingDate}</td>
                <td>${order.evasionDate}</td>
                <td>
                  <form action="/admin/order/delete/${order.id}" method="post"><input type="submit" value="Rimuovi"/></form>
                </td>
              <td>
                  <form action="/admin/order/evadi/${order.id}" method="post"><input type="submit" value="Evadi ordine"/></form>
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
                $('#test').DataTable({
                    "language": {
                        "url": "http://cdn.datatables.net/plug-ins/1.10.7/i18n/Italian.json"
                    }
                });
            });
        </script>
    </jsp:attribute>

</t:layout>
