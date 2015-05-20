<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>


    <jsp:attribute name="title">Aggiungi prodotto</jsp:attribute>

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

    </jsp:attribute>

</t:layout>