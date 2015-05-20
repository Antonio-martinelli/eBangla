<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Gestione dei fornitori</jsp:attribute>

    <jsp:attribute name="head">
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="yeld">

        <form:form id="form-data" method="post" action="/admin/supplier" commandName="supplier" class="form-horizontal">

            <form:label path="iva">Partita iva</form:label>
            <form:input path="iva"/>

            <form:label path="email">Email</form:label>
            <form:input path="email"/>

            <form:label path="phone">Numero di telefono</form:label>
            <form:input path="phone"/>


            <input type="submit" value="aggiungi fornitore">

        </form:form>

      <c:if test="${!empty suppliers}">
          <h3>Fornitori</h3>
          <table id="supplier">
              <thead>
              <tr>
                  <th>Partita iva</th>
                  <th>Email</th>
                  <th>Numero di telefono</th>
                  <th>&nbsp;</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${suppliers}" var="supplier">
                  <tr>
                      <td>${supplier.iva}</td>
                      <td>${supplier.email}</td>
                      <td>${supplier.phone}</td>

                      <td>
                          <form action="/admin/supplier/delete/${supplier.id}" method="post"><input type="submit" value="Delete"/></form>
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
                $('#supplier').DataTable({
                    "language": {
                        "url": "http://cdn.datatables.net/plug-ins/1.10.7/i18n/Italian.json"
                    }
                });
            });
        </script>
    </jsp:attribute>

</t:layout>
