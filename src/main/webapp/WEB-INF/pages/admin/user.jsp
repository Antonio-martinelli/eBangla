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

        <h1>Gestione degli utenti</h1>

        <form:form id="form-data" method="post" action="/admin/user" commandName="user" class="form-horizontal">
            <spring:hasBindErrors name="address"></spring:hasBindErrors>

            <form:label path="firstName">Nome</form:label>
            <form:errors path="firstName"></form:errors>
            <form:input path="firstName"/>

            <form:label path="lastName">Cognome</form:label>
            <form:errors path="lastName"></form:errors>
            <form:input path="lastName"/>

            <form:label path="email">Email</form:label>
            <form:input path="email"/>

            <form:label path="password">Password</form:label>
            <form:errors path="password"></form:errors>
            <form:input type="password" path="password"/>

            <form:label path="city">Citt&agrave;</form:label>
            <form:errors path="city"></form:errors>
            <form:input path="city"/>

            <form:label path="cap">Cap</form:label>
            <form:errors path="cap"></form:errors>
            <form:input path="cap"/>

            <form:label path="address_line">Via</form:label>
            <form:errors path="address_line"></form:errors>
            <form:input path="address_line"/>

            <input type="submit" value="aggiungi utente">

        </form:form>

        <c:if test="${!empty users}">
            <table id="user">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Indirizzo</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.lastName}, ${user.firstName}</td>
                        <td>${user.email}</td>
                        <td>${user.city}, ${user.address_line}, ${user.cap}</td>
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
