<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Gestione degli utenti</jsp:attribute>

    <jsp:attribute name="head">
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="yeld">

        <form:form id="form-data" method="post" action="/admin/user" commandName="user" class="form-horizontal">
            <form:label path="firstName">Nome</form:label>
            <form:input path="firstName"/>

            <form:label path="lastName">Cognome</form:label>
            <form:input path="lastName"/>

            <form:label path="email">Email</form:label>
            <form:input path="email"/>

            <form:label path="address.city">Citt&agrave;</form:label>
            <form:input path="address.city"/>

            <form:label path="address.cap">Cap</form:label>
            <form:input path="address.cap"/>

            <form:label path="address.address_line">Via</form:label>
            <form:input path="address.address_line"/>

            <input type="submit" value="aggiungi utente">

        </form:form>

        <c:if test="${!empty users}">
            <h3>User</h3>
            <table id="user">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.lastName}, ${user.firstName}</td>
                        <td>${user.email}</td>
                        <td>
                            <form action="/admin/user/delete/${user.id}" method="post"><input type="submit" class="btn btn-danger btn-mini" value="Delete"/></form>
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
                $('#user').DataTable({
                    "language": {
                        "url": "http://cdn.datatables.net/plug-ins/1.10.7/i18n/Italian.json"
                    }
                });
            });
        </script>
    </jsp:attribute>

</t:layout>
