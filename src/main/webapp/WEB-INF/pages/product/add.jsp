<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Aggiungi prodotto</jsp:attribute>

    <jsp:attribute name="yeld">

        <form:form method="post" action="/product/add" commandName="product">

            <form:label path="name">Name:</form:label>
            <form:input path="name"/>

            <form:label path="description">Description:</form:label>
            <form:input path="description"/>

            <form:label path="price">Price:</form:label>
            <form:input path="price"/>

            <input type="submit" value="insert">

        </form:form>

    </jsp:attribute>

</t:layout>