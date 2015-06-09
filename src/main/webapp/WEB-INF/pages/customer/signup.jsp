<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Ebangla - signup</jsp:attribute>


    <jsp:attribute name="yeld">

        <h1>Registrati su Ebangla</h1>

        <form:form id="form-data" method="post" action="/signup" modelAttribute="user">

            <form:label path="firstName">Nome</form:label>
            <form:errors path="firstName"></form:errors>
            <form:input path="firstName"/>

            <form:label path="lastName">Cognome</form:label>
            <form:errors path="lastName"></form:errors>
            <form:input path="lastName"/>

            <form:label path="username">Username</form:label>
            <form:input path="username"/>

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

            <input type="submit" value="registrati">

        </form:form>

    </jsp:attribute>

</t:layout>
