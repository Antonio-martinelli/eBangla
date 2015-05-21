<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Ebangla - login</jsp:attribute>


    <jsp:attribute name="yeld">

        <h1>Effettua il login</h1>

        <form:form id="form-data" method="post" action="/login" modelAttribute="user">

            <form:label path="username">Username</form:label>
            <form:errors path="username"></form:errors>
            <form:input path="username"/>

            <form:label path="password">Password</form:label>
            <form:errors path="password"></form:errors>
            <form:input type="password" path="password"/>

            <input type="submit" value="accedi">

        </form:form>

    </jsp:attribute>

</t:layout>
